class Admin::CategoriesController < Admin::BaseController
  before_action :set_category, only: [:show, :edit, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "You've successfully created a new category!"

      redirect_to admin_category_path(@category)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @category = Category.update(category_params)

    redirect_to admin_category_path(@category)
  end

  def destroy
    @category.destroy

    redirect_to admin_categories_path
  end


  private

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end
end
