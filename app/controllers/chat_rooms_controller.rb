class ChatRoomsController < ApplicationController
  before_action :require_login, only: [:edit, :update, :destroy]

  before_action :set_chat_room, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @messages = @chat_room.messages.includes(:user)
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
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
  @chat_room = ChatRoom.find(params[:id])
  @chat_room.destroy
  redirect_to chat_rooms_path, notice: "Chat room deleted successfully."
end


  private

  # Strong parameters for chat rooms
  def chat_room_params
    params.require(:chat_room).permit(:name)
  end

  # Find chat room and handle record not found
  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to chat_rooms_path, alert: "Chat room not found."
  end

  # Ensure user is logged in
  def require_login
    unless logged_in?
      redirect_to new_session_path, alert: "Please log in to access this feature."
    end
  end

  # Allow only the chat room creator or admin to edit/delete
  def authorize_user!
    unless current_user&.admin? || @chat_room.user == current_user
      redirect_to chat_rooms_path, alert: "You are not authorized to perform this action."
    end
  end
end
