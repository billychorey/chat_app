class ChatRoomsController < ApplicationController
  before_action :require_login, except: [:index, :show] # Allow index and show for unauthenticated users
  before_action :set_chat_room, only: [:show, :edit, :update, :destroy] # DRY pattern for finding chat room
  before_action :authorize_admin, only: [:edit, :update, :destroy] # Restrict certain actions to admin users

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    @messages = @chat_room.messages.includes(:user) # Load associated users for efficiency
  end


  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = ChatRoom.new(chat_room_params)
    if @chat_room.save
      redirect_to chat_rooms_path, notice: "Chat room created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @chat_room.update(chat_room_params)
      redirect_to chat_rooms_path, notice: "Chat room updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @chat_room.destroy
    redirect_to chat_rooms_path, notice: "Chat room deleted successfully."
  end

  private

  # Strong parameters for creating/updating chat rooms
  def chat_room_params
    params.require(:chat_room).permit(:name)
  end

  # Find chat room before specific actions
  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to chat_rooms_path, alert: "Chat room not found."
  end

  # Redirect unauthenticated users
  def require_login
    unless logged_in?
      redirect_to new_session_path, alert: "Please log in to access this feature."
    end
  end

  # Restrict editing and deleting chat rooms to admin users
  def authorize_admin
    unless current_user&.admin?
      redirect_to chat_rooms_path, alert: "You are not authorized to perform this action."
    end
  end
end
