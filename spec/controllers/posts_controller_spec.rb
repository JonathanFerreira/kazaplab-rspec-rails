require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before { sign_in create(:user) }

  describe 'GET #index' do
    before { create_list(:post, 5) }

    it 'retorna todos os posts' do
      get :index
      expect(assigns(:posts)).to eq Post.all
    end
  end

  describe 'GET #new' do
    it 'retorna uma instancia' do
      get :new
      expect(assigns(:post)).to be_instance_of Post
    end

    it 'renderiza template new' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #show' do
    let!(:post) { create :post }

    it 'retorna o post' do
      get :show, params: { id: post }
      expect(assigns(:post)).to eq post
    end

    it 'renderiza template show' do
      get :show, params: { id: post }
      expect(response).to render_template :show
    end
  end
end
