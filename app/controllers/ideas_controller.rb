class IdeasController < ApplicationController
  before_action :set_user
  before_action :categories_all

  def index
    @ideas = @user.ideas.all
  end

  def show
    @idea = @user.ideas.find(params[:id])
  end

  def new

    @idea = @user.ideas.new
  end

  def create
    @idea = @user.ideas.new(idea_params)
    if @idea.save
      flash[:success] = "You've created your new Idea!"

      redirect_to user_idea_path(@user, @idea)
    else
      render :new
    end
  end

  def edit

    @idea = Idea.find(params[:id])
  end

  def update
    @category = Category.all
    @idea = @user.ideas.update(idea_params)

    redirect_to user_idea_path(@user, @idea)
  end

  def destroy
    @idea = @user.ideas.find(params[:id])
    @idea.destroy

    redirect_to user_ideas_path(@user)
  end



  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def categories_all
    @categories = Category.all
  end

  def idea_params
    params.require(:idea).permit(:title, :category_id)
  end
end
