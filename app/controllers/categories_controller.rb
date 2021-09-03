class CategoriesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :handle_error
  #devise
  before_action :authenticate_user!,
                :find_category_by_id, except: [:index, :new, :create]
  
  def index
    @categories = current_user.categories.all.order("id")
    @tasks = current_user.tasks.order("due_date")
    @tasks_today = current_user.tasks.all.where('due_date <= ?', DateTime.now).order("due_date ASC").order("due_date ASC")
  end

  def new
    @category = Category.new
    respond_to do |format|
      format.html
      format.js 
    end
  end

  def create
    @category = Category.new(category_params)
    @category.user_id = current_user.id
    @category.save
    if @category.save 
      #specify return redirect later
      redirect_to @category, success: "Category successfully created", fallback_location: categories_path
    else
      redirect_to @category, danger: "Invalid name or description", fallback_location: categories_path
    end
  end

  def show
    @categories = current_user.categories.all.order("id")
    @tasks = @category.tasks.order("due_date ASC")
    @current_category_id = params[:id]
    @tasks_today = @category.tasks.all.where('due_date <= ?', DateTime.now).order("due_date ASC")
  end

  def edit
    respond_to do |format|
      format.html
      format.js 
    end
  end

  def update
    @category.update(category_params)

    if @category.update(category_params)
      redirect_back(fallback_location: categories_path, success: "Category successfully updated")
    else
      redirect_back(fallback_location: categories_path, danger: "Invalid name or description")
    end
    
    
  end

  def destroy
    @category.destroy

    if @category.destroy
      redirect_to categories_path, success: "Category successfully deleted"
    else  
      redirect_back(fallback_location: categories_path, danger: "Error occured in deletion. Please try again.")
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

  def find_category_by_id
    @category = Category.find(params[:id])
  end
end
