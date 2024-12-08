class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    # Clear session if the user record no longer exists
    @current_user ||= User.find_by(id: session[:user_id])
    session[:user_id] = nil if @current_user.nil?
    @current_user
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      redirect_to new_session_path, alert: "Please log in to continue."
    end
  end
end
