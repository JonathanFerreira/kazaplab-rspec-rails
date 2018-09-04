module API
  class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :destroy, :update]

    include ExceptionHandler

    # GET /api/todos
    def index
      @todos = Todo.all
      render json: @todos, status: :ok
    end

    # GET /api/todos/:id
    def show
      render json: @todo, status: :ok
    end

    def create
      @todo = Todo.create!(todo_params)
      render json: @todo, status: :ok
    end

    # DELETE /api/todos/:id
    def destroy
      @todo.destroy
      head :ok
    end

    # PUT /api/todos/:id
    def update
      @todo.update(todo_params)
      render json: @todo, status: :ok
    end

    private

    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.permit(:name, :done)
    end
  end
end
