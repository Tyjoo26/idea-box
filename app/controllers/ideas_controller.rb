class IdeasController < ApplicationController

  def index
    @category = Category.find(params[:category_id])
    @ideas = @category.ideas.all
  end

  def show
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.find(params[:id])
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
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.find(params[:id])
  end

  def update
    category = Category.find(params[:category_id])
    idea = category.ideas.update(idea_params)

    redirect_to category_idea_path(category, idea)
  end

  def destroy
    @category = Category.find(params[:category_id])
    @idea = @category.ideas.find(params[:id])
    @idea.destroy

    redirect_to category_ideas_path(@category)
  end



  private



  def idea_params
    params.require(:idea).permit(:title)
  end
end
