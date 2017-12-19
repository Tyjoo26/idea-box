class IdeasController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @ideas = @user.ideas.all
  end

  def show
    @user = User.find(params[:user_id])
    @idea = @user.ideas.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.new
  end

  def create
    category = Category.find(params[:category_id])
    idea = category.ideas.new(idea_params)
    if idea.save
      flash[:success] = "You've created your new Idea!"

      redirect_to category_idea_path(category, idea)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @categories = Category.all
    @idea = Idea.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @category = Category.all
    @idea = @user.ideas.update(idea_params)

    redirect_to user_idea_path(@user, @idea)
  end

  def destroy
    @user = User.find(params[:user_id])
    @idea = @user.ideas.find(params[:id])
    @idea.destroy

    redirect_to user_ideas_path(@user)
  end



  private



  def idea_params
    params.require(:idea).permit(:title, :category_id)
  end
end
