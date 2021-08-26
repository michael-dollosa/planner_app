class TasksController < ApplicationController
  
  #new is not created since we would render a form inside a different erb file

  def new
    @task = Task.new()
  end
  
  def create
    @task = Task.new(task_params)
    @task.category_id = params[:category_id]
    @task.save
  end

  def show
    @task = Task.find(params[:id])
  end
  
  def edit
  
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
  end

  private

  def task_params
    params.require(:task).permit(:title, :body)
  end
end
