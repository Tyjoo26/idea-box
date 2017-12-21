class Admin::PicturesController < ApplicationController

  def index
    @pictures = Picture.order("created_at DESC")
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      flash[:success] = "You've uploaded a Picture"

      redirect_to admin_pictures_path
    else
      render :new
    end
  end


  private

    def picture_params
      params.require(:picture).permit(:title, :body, :image)
    end
end
