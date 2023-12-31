class Comment < ApplicationRecord
  belongs_to :blog
  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email format" }
  validates :content, presence: true, length: { minimum: 2, maximum: 1000 , message: "should be between 2 and 1000 characters"}
end
