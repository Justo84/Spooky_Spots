class ReviewsController < ApplicationController
  before_filter :authorize!

  def edit
    @location = Location.find(params[:location_id])
    @review = Review.find(params[:id])
    authenticate_review(@review)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review].permit(:description, :spo_rating, :sce_rating, :exp_rating))
      flash[:notice] = "Review edited"
      redirect_to parent
    else
      flash[:notice] = "Review update failed"
      @location = parent
      @errors = @review.errors.full_messages
      render "reviews/edit"
    end
  end

  def new
    @location = Location.find(params[:location_id])
    @review = Review.new
  end

  def create
    @location_id = params[:location_id]
    @location = Location.find(params[:location_id])
    @review = Review.new(review_params)
    @review.location_id = @location_id
    @review.user = current_user

    if @review.save
      flash[:notice] = "Review created"
      redirect_to location_path(@location.id)
    else
      flash[:notice] = "Please fill out form correctly"
      @errors = @review.errors.full_messages
      render "reviews/new"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    return unless authenticate_review(@review)
    @location = @review.location
    @review.destroy
    flash[:notice] = "Review deleted"
    redirect_to location_path(@location)
  end

  private

  def parent
    @location ||= Location.find(params[:location_id])
  end

  def review_params
    params.require(:review).permit(:description, :spo_rating, :sce_rating, :exp_rating)
  end
end
