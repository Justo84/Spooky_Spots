class LocationsController < ApplicationController
  before_filter :authorize!, except: [:index, :show]

  def index
    @locations = Location.search(params[:search])
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    if @location.update_attributes(params[:location].permit(:name, :description, :state, :town, :latitude, :longitude, :street, :size, :history, :endorsed))
      redirect_to parent
    else
      @location = parent
      flash[:notice] = "Please fill out form completely"
      @errors = @location.errors.full_messages
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
    @reviews = @location.reviews.page(params[:page]).per(3)
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
      flash[:notice] = "Location created"
      redirect_to location_path(@location)
    else
      flash[:notice] = "Please fill out form completely"
      @errors = @location.errors.full_messages
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
