class ReviewsController < ApplicationController

  def edit
    #    @errors = @review.errors.full_messages
    @location = Location.find(params[:location_id])
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update_attributes(params[:review].permit(:description, :spo_rating, :sce_rating, :exp_rating))
      flash[:notice] = "Review edited"
      redirect_to parent
    else
#      @review = parent
#      render "locations/edit"
       render :new
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
    # @review.location = @location
    @review.user = current_user

    if @review.save
      redirect_to location_path(@location.id)
      # redirect_to parent
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    return unless authenticate_review(@review)
    @location = @review.location
    @review.destroy
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
