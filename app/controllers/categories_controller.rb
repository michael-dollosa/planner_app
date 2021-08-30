class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @tasks = Task.all
    @tasks_today = Task.all.where('due_date <= ?', DateTime.now)
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
    @category.save
    if @category.save 
      #specify return redirect later
      redirect_to @category, success: "Category successfully created", fallback_location: categories_path
    else
      redirect_to @category, danger: "Invalid name or description", fallback_location: categories_path
    end
    
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @tasks = @category.tasks
    @current_category_id = params[:id]
    @tasks_today = Task.all.where('due_date <= ?', DateTime.now-1)
  end

  def edit
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html
      format.js 
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    if @category.update(category_params)
      redirect_back(fallback_location: categories_path, success: "Category successfully updated")
    else
      redirect_back(fallback_location: categories_path, danger: "Invalid name or description")
    end
    
    
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
