class LocationImagesController < ApplicationController
  def create
    @image = LocationImage.new(location_image_params)

    if @image.save
      flash[:notice] = "Image posted"
      redirect_to location_path(@image.location_id)

    else
      flash[:notice] = "Upload failed"

      @location = Location.find(params[:location_id])
      @user = current_user

      # @reviews = @location.reviews.page params[:page]
      # @review = Review.new
            
      render "locations/show"
    end
  end

  private

  def location_image_params
    params.require(:location_image).permit(:location_id, :image, :description)
  end
end
