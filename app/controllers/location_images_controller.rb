class LocationImagesController < ApplicationController  
  def create
    @image = LocationImage.new(location_image_params)
    @location = Location.find(params[:location_id])
    @reviews = @location.reviews
    @image.user = current_user

    if @image.save
      flash[:notice] = "Image posted"
      redirect_to location_path(@image.location_id)
    else
      flash[:notice] = "Upload failed"
      render "locations/show"
    end
  end

  def destroy
    @user = current_user
    @location = Location.find(params[:location_id])
    @image = LocationImage.find(params[:id])
    authenticate_image(@image)
    @image.destroy
    flash[:notice] = "Image Deleted"
    redirect_to location_path(@location)
  end

  private

  def location_image_params
    params.require(:location_image).permit(:location_id, :image, :description)
  end
end
