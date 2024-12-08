class UsersController < ApplicationController
  # List all users
  def index
    @users = User.all
  end

  # Show a single user
    def show
    @user = User.find(params[:id])
    end


  # Form for creating a new user
  def new
    @user = User.new
  end

  # Create a new user
    def create
    @user = User.new(user_params)
    if @user.save
        redirect_to users_path, notice: "User created successfully."
    else
        flash.now[:alert] = "There was an error creating the user."
        render :new, status: :unprocessable_entity
    end
    end


  # Form for editing a user
    def edit
    @user = User.find(params[:id])
    end


  # Update an existing user
    def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        redirect_to users_path, notice: "User updated successfully."
    else
        flash.now[:alert] = "Failed to update user."
        render :edit, status: :unprocessable_entity
    end
    end


  # Delete a user
    def destroy
    @user = User.find(params[:id])
    if @user == current_user
        @user.destroy
        session[:user_id] = nil # Log out the user after deleting their account
        redirect_to root_path, notice: "Your account has been deleted."
    else
        redirect_to users_path, alert: "You can only delete your own account."
    end
    end


  private

  # Strong parameters for user creation and updates
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
