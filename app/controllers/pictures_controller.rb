class PicturesController < ApplicationController

	before_action :set_picture, only: [:show, :edit, :update]
 
  def index
    @pictures = Picture.order('created_at DESC')
  end
 
  def show
  end
 
  def new
      #@picture = Listing.find(55).pictures.new
      
    @picture = Listing.find(params[:listing_id]).build_picture
  end
 
  def create  
    @picture = Picture.new(picture_params)
    if @picture.save
      #redirect_to pictures_path

      render 'show'
    else
      render :new
    end
  end
 
  def edit
  end
 
  def update
    if @picture.update_attributes(picture_params)
      redirect_to picture_path(@picture)
    else
      render :edit
    end
  end
 
  private
 
  def picture_params
    params.require(:picture).permit( :description, :listing_id, :remove_image, attachments: [])
  end
 
  def set_picture
    @picture = Picture.find(params[:id])
  end

end
