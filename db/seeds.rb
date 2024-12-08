# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Create users
alice = User.create(name: "Alice")
bob = User.create(name: "Bob")

# Create a chat room
general = ChatRoom.create(name: "General")

# Create messages
Message.create(content: "Hello, everyone!", user: alice, chat_room: general)
Message.create(content: "Hi Alice!", user: bob, chat_room: general)
