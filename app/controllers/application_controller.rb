class ApplicationController < ActionController::Base

  helper_method :current_user,
                :signed_in?

  private

  def authenticate_user!
    unless current_user
      session[:referrer] = request.url
      redirect_to "/sign-in"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def signed_in?
    current_user.present?
  end

end
