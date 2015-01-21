class Admin::LocationsController < ApplicationController
  before_action :authorize!

  def update
    @location = Location.find(params[:id])

    if @location.update(location_params)
      flash[:notice] = "Updated location."
      redirect_to location_path(@location)
    else
      flash[:alert] = "Could not update location."
      render "locations/show"
    end
  end

  private

  def location_params
    params.require(:location).permit(:endorsed)
  end
end
