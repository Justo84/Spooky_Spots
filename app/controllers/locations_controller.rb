class LocationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search]
      @locations = Location.search(params[:search])
      if @locations.empty?
        flash[:notice] = "No matches."
      end
    else
      @locations = Location.all
    end
    # @locations = Location.all
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
    @spo_average = Review.where(location_id:params[:id]).average("spo_rating")
    @sce_average = Review.where(location_id:params[:id]).average("sce_rating")
    @exp_average = Review.where(location_id:params[:id]).average("exp_rating")
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
