class UsersController < ApplicationController
  before_action :logged_in?, only: [:show]

  def show
    if current_user.id == session[:user_id]
      @user = User.find(params[:id])
    else
      render_404
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

    def users_params
      params.require(:user).permit(:user_name, :password)
    end
end
