class SessionsController < ApplicationController
  def new
    # Render login form
  end

  def create
    user = User.find_by(name: params[:name])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged in successfully."
    else
      flash.now[:alert] = "Invalid name or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session # Clear the session
    redirect_to root_path, notice: "Logged out successfully."
  end
end
