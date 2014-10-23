class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js

  def index
    if current_user
      todos = current_user.todos
      @completed_todos = todos.complete 
      @incomplete_todos = todos.incomplete
    else
      @completed_todos = []
      @incomplete_todos = []
    end

    @todo = Todo.new
  end

  def show
    #@todos = Todo.find(todo_params)
  end

  def new
    @todo = Todo.new
  end

   def edit
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user = current_user
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @todo }
        format.json { render action: 'index', status: :created, location: @todo }
      else
        format.html { render action: 'new' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    @todo.completed = !@todo.completed
    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, notice: 'Todo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { redirect_to todos_path, notice: 'Todo was not successfully updated.' }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy
      respond_to do |format|
      format.html { redirect_to todos_url }
      format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:item, :completed, :user_id, :days_left)
    end
end
