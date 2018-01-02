class IdeasController < ApplicationController
  before_action :set_user
  before_action :categories_all
  before_action :logged_in?


  def index
    if current_user.id == session[:user_id]
      @ideas = @user.ideas.all
    else
      render_404
    end
  end

  def show
    @idea = @user.ideas.find(params[:id])
  end

  def new
    @idea = @user.ideas.new
    @pictures = Picture.all
  end

  def create
    # todo: create idea, pass it to the other view
    # create upload association so we can access obj.ideas and obj.pictures...

    @idea = @user.ideas.new(idea_params)

    # idea_id, picture_id

    if @idea.save
      flash[:success] = "You've created your new Idea!"
      Upload.create(picture_id: params[:picture_ids][0].to_i, idea_id: @idea.id)
      redirect_to user_idea_path(@user, @idea)
    else
      render :new
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
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
