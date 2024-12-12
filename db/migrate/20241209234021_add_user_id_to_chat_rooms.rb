class AddUserIdToChatRooms < ActiveRecord::Migration[7.0]
  def change
    # Add the column as nullable first
    add_reference :chat_rooms, :user, foreign_key: true, null: true

    # Populate existing rows with a default user_id
    reversible do |dir|
      dir.up do
        default_user_id = User.first&.id || 1 # Replace with a valid user ID if needed
        ChatRoom.update_all(user_id: default_user_id)
      end
    end

    # Change the column to NOT NULL after populating
    change_column_null :chat_rooms, :user_id, false
  end
end
