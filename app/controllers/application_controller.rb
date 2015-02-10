class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def authorize!
    if current_user.nil? && !current_user.is_admin?
      flash[:notice] = "You are not authorized to view this resource."
      redirect_to root_path
    end
  end

  def authenticate_admin
    unless current_user && current_user.role == "admin"
      flash[:notice] = "Only an admin can do that"
      redirect_to root_path
      return false
    end
    true
  end

  def authenticate_review(review)
    if current_user.id != review.user_id && current_user.role != "admin"
      flash[:notice] = "Only the owner for this review can do that"
      redirect_to location_path(review.location_id)
      return false
    end
    true
  end

  def authenticate_image(image)
    if current_user.id != image.user_id && current_user.role != "admin"
      flash[:notice] = "Only the owner for this image can do that"
      redirect_to location_path(image.location_id)
      return false
    end
    true
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username]
  end

end
