class User < ApplicationRecord
  has_many :messages
  has_many :chat_rooms, dependent: :destroy
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def admin?
    self.admin
  end
end
