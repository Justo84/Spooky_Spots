class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
#     @location = parent.locations.new(location_params)
    @location.user = current_user
    if @location.save
     redirect_to locations_path(@location[:id])
#      redirect_to parent
    else
     render :new
  #    render "locations/show"
    end
  end

  private

  # def parent
  #   @location ||= Location.find(params[:location_id])
  # end


  def location_params
    params.require(:location).permit(:name, :description, :state, :town, :latitude, :longitude, :street, :size, :history, :private_land, :in_use)
  end

end
