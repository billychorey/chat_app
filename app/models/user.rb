class User < ApplicationRecord
  has_many :messages
  has_many :chat_rooms, dependent: :destroy
  has_secure_password

    validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  def admin?
    self.admin
  end
end
