class ReviewsController < ApplicationController

  # def show
  #
  # end

  def new
    @location = Location.find(params[:location_id])
    @review = Review.new
  end

  def create
    @location_id = params[:location_id]
    @location = Location.find(params[:location_id])
    @review = Review.new(review_params)
    @review.location_id = @location_id
    # @review = Review.new(review_params)
    # @review.location = @location

    if @review.save
      redirect_to location_path(@location.id)
      # redirect_to parent
    else
      render :new
    end
  end

  private

  # def parent
  #   @location ||= Location.find(params[:location_id])
  # end

  def review_params
    params.require(:review).permit(:description, :spo_rating, :sce_rating, :exp_rating)
  end
end
