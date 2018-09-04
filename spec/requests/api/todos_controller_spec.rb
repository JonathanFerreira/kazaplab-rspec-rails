require 'rails_helper'

RSpec.describe API::TodosController, type: :request do
  describe 'GET /todos' do
    before { create_list :todo, 3 }

    it 'retorna todas as todos' do
      get '/api/todos'
      expect(body).to eq Todo.all.to_json
    end
  end

  describe 'GET /todos/:id' do
    context 'quando encontra a todo' do
      let!(:todo) { create(:todo) }

      it 'retorna a todo encontrada' do
        get "/api/todos/#{todo.id}"
        expect(body).to eq(todo.to_json)
      end
    end

    context 'quando não encontra a todo' do
      it 'retorna mensagem de erro' do
        get "/api/todos/0"
        expect(body).to match(/Couldn't find Todo/)
      end
    end
  end

  describe 'POST /api/todos' do
    context 'quando os atributos são validos' do
      let(:atributos_validos) { { name: 'Nova tarefa' } }

      it 'cria uma todo' do
        expect do
          post '/api/todos', params: atributos_validos
        end.to change(Todo, :count).by(1)
      end

      it 'retorna status de sucesso' do
        post '/api/todos', params: atributos_validos
        expect(response).to have_http_status(:ok)
      end
    end

    context 'quando os atributos são invalidos' do
      let(:atributos_invalidos) { { name: '' } }

      it 'retorna messagem com erro' do
        post '/api/todos', params: atributos_invalidos
        expect(body).to match(/Name can't be blank/)
      end

      it 'retorna status de erro' do

      end
    end
  end

  describe 'DELETE /api/todos/:id' do
    let!(:todo_id) { create(:todo).id }

    context 'quando a todo existe' do
      it 'retorna status 200' do
        delete "/api/todos/#{todo_id}"
        expect(response).to have_http_status(:ok)
      end

      it 'exclui a todo' do
        expect do
          delete "/api/todos/#{todo_id}"
        end.to change(Todo, :count).by(-1)
      end
    end

    context 'quando a todo não existe' do
      it 'retorna mensagem de erro' do
        delete '/api/todos/0'
        expect(body).to match(/Couldn't find Todo/)
      end
    end
  end

  describe 'PUT /api/todos/:id' do
    let!(:todo_id) { create(:todo).id }
    let(:attributes) { { name: 'Novo nome!' } }

    context 'quando a todo existe' do
      it 'atualiza todo' do
        put "/api/todos/#{todo_id}", params: attributes
        expect(json['name']).to eq('Novo nome!')
      end

      it 'retorna status 200' do
        put "/api/todos/#{todo_id}", params: attributes
        expect(response).to have_http_status(:ok)
      end
    end

    context 'quando a todo não existe' do
      it 'retorna mensagem de erro' do
        put '/api/todos/0', params: attributes
        expect(body).to match(/Couldn't find Todo/)
      end
    end
  end
end
