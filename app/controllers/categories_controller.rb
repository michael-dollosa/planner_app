class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    byebug
    @category.save
    #specify return redirect later
  end

  def show
    @category = Category.find(params[:id])
    @tasks = @category.tasks
  end

  def edit

  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
