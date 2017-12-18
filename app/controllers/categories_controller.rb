class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      flash[:success] = "You've created a new category"

      redirect_to category_path(category)
    else
      redirect :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.update(category_params)

    redirect_to categories_path
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy

    redirect_to categories_path
  end


  private


  def category_params
    params.require(:category).permit(:name)
  end
end
