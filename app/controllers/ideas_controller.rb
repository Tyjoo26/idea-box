class IdeasController < ApplicationController
  before_action :set_article, only: [:show, :edit]

  def index
    @ideas = Idea.all
  end

  def show

  end

  def new
    @idea = Idea.new
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      flash[:success] = "You've created your new Idea!"

      redirect_to idea_path(idea)
    else
      render :new
    end
  end

  def edit

  end

  def update
    idea = Idea.update(idea_params)

    redirect_to idea_path(idea)
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy

    redirect_to ideas_path
  end



  private

  def set_article
    @idea = Idea.find(params[:id])
  end


  def idea_params
    params.require(:idea).permit(:title)
  end
end
