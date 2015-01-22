class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @locations = Location.all
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location].permit(:name, :description, :state, :town, :street, :size, :history, :endorsed))
      redirect_to parent
    else
      @location = parent
      render "locations/edit"
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    redirect_to root_path
  end

  def show
    @location = Location.find(params[:id])
    @reviews = @location.reviews
    @user = current_user
    @image = LocationImage.new
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user
    if @location.save
     redirect_to location_path(@location)
    else
      render "locations/new"
    end
  end

  private

  def parent
    @location ||= Location.find(params[:location_id])
  end


  def location_params
    params.require(:location).permit(:name, :description, :state, :town, :latitude, :longitude, :street, :size, :history, :private_land, :in_use)
  end

end
