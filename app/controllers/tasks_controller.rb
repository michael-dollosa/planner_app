class TasksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error
  #devise
  before_action :authenticate_user!,
                :find_task_by_id, except: [:new, :create]

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
    @task.user_id = current_user.id
    @task.category_id = params[:category_id]
    @task.save

    if @task.save
      redirect_back fallback_location: categories_path, success: "Successfully created a task"
    else
      redirect_back fallback_location: categories_path, danger: "Kindly double check all information before submitting"
    end
    
  end

  def show
    respond_to do |format|
      format.html
      format.js 
    end
  end
  
  def edit
    respond_to do |format|
      format.html
      format.js 
    end
  end

  def update
    @task.update(task_params)

    if @task.update(task_params)
      redirect_back fallback_location: categories_path, success: "Successfully updated task"
    else
      redirect_back fallback_location: categories_path, danger: "Kindly double check all information before submitting"
    end
  end

  def destroy
    @task.delete

    if @task.delete
      redirect_back(fallback_location: categories_path, success: "Successfully updated task")
    else
      redirect_back(fallback_location: categories_path, success: "Error occured in deletion. Please try again.")
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :body, :status, :due_date)
  end

  def find_task_by_id
    @task = current_user.tasks.find(params[:id])
  end
end
