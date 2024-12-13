# db/seeds.rb

# Create some users
user1 = User.create!(
  name: "Alice",
  email: "alice@example.com",
  password: "password123"
)

user2 = User.create!(
  name: "Bob",
  email: "bob@example.com",
  password: "password123"
)

# Create some chat rooms
chat_room1 = ChatRoom.create!(
  name: "General",
  user: user1 # Assuming chat rooms belong to a user
)

chat_room2 = ChatRoom.create!(
  name: "Hot Takes",
  user: user2
)

# Create some messages
Message.create!(
  content: "Hello from Alice",
  user: user1,
  chat_room: chat_room1
)

Message.create!(
  content: "Hello from Bob",
  user: user2,
  chat_room: chat_room2
)
