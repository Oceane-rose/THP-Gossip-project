class User < ApplicationRecord

  # adding validations
  validates :email, presence: true, uniqueness: {message: "email already subscribed"}, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  validates :first_name, presence: true, format: { with: /\A[-'a-zA-ZÀ-ÖØ-öø-ÿ]+\z/, message: "%{value} is not a valid first name" }
  validates :last_name, presence: true, format: { with: /\A[-'a-zA-ZÀ-ÖØ-öø-ÿ]+\z/, message: "%{value} is not a valid last name" }
  validates :city, presence: true
  validates :age, presence:true, numericality: { greater_than_or_equal_to: 6, less_than: 100, message: "%{value} is not a valid age or not respecting the terms of service" }
  validates :password_digest, presence: true



  has_secure_password

  belongs_to :city
  # 1-N association with gossips table
  has_many :gossips

  # 1-N association with sent_messages (private_messages) table
  # users renamed as senders for this association, class_name explains it to Rails
  has_many :sent_messages, foreign_key: :sender_id, class_name: 'PrivateMessage'

  # 1-N association with message_deliverings table
  has_many :message_deliverings, foreign_key: :recipient_id

  # N-N association with received_messages (private_messages) table via the message_deliverings table
  # renamed as recipients but doesn't show here
  has_many :received_messages, through: :message_deliverings

  # 1-N associations with comments
  has_many :comments

  # 1-N associations with likes
  has_many :likes
end
