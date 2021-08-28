class CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @tasks = Task.all
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
    #specify return redirect later
    redirect_back(fallback_location: categories_path)
  end

  def show
    @category = Category.find(params[:id])
    @categories = Category.all
    @tasks = @category.tasks
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
    redirect_back(fallback_location: categories_path)
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
