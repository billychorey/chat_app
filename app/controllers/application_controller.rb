class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in? # Makes these methods available in views

  private

  # Get the currently logged-in user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Check if the user is logged in
  def logged_in?
    current_user.present?
  end

  # Ensure user is logged in
  def require_login
    unless logged_in?
      redirect_to new_session_path, alert: "Please log in to access this feature."
    end
  end
end
