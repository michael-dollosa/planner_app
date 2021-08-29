class TasksController < ApplicationController
  
  #new is not created since we would render a form inside a different erb file

  def new
    @task = Task.new()
    respond_to do |format|
      format.html
      format.js 
    end
  end

  def create
    @task = Task.new(task_params)
    @task.status = "new"
    @task.category_id = params[:category_id]
    @task.save
    redirect_back(fallback_location: categories_path)
  end

  def show
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html
      format.js 
    end
  end
  
  def edit
    @task = Task.find(params[:id])
    respond_to do |format|
      format.html
      format.js 
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_back(fallback_location: categories_path)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.delete
    redirect_back(fallback_location: categories_path)
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :status, :due_date)
  end
end
