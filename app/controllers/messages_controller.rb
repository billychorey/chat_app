class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user = current_user # Assign logged-in user

    if @message.save
      redirect_to chat_room_path(@message.chat_room_id), notice: "Message sent successfully."
    else
      redirect_to chat_room_path(@message.chat_room_id), alert: "Failed to send message."
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chat_room_id)
  end
end
