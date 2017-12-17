class IdeasController < ApplicationController


  def show
    @idea = Idea.find(params[:id])
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      flash[:success] = "You've created your new Idea!"

      redirect_to idea_path(@idea)
    else
      render :new
    end
  end




  private

  def idea_params
    params.require(:idea).permit(:title)
  end
end
