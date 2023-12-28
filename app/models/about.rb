class About < ApplicationRecord
  has_one_attached :image
  validates :description, presence:true
  validates :description, length: { minimum: 5, maximum: 500 }
end
