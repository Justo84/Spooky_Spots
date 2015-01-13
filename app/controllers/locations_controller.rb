class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def edit
#    @errors = @review.errors.full_messages
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location].permit(:name, :description, :state, :town, :street, :size, :history))
      flash[:notice] = "Location edited"
      redirect_to @location
    else
      @location = parent
      render "locations/edit"
    end
  end


  def show
    @location = Location.find(params[:id])
    @reviews = @location.reviews
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path(@location[:id])
    else
      render :new
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :description, :state, :town, :latitude, :longitude, :street, :size, :history, :private_land, :in_use)
  end

end
