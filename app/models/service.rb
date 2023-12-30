class Service < ApplicationRecord
  enum :category, [:frontend_development, :backend_development, :devops]
  validates :service_description, :category, presence: { message: "Can't be blank" }
  validates :service_name, presence: { message: "Can't be blank" },format: { with: /\A[a-z A-Z\s]+\z/, message: "only allows letters and spaces" },length: { minimum: 2, maximum: 50, message: "should be between 2 and 50 characters" }
  has_one_attached :service_image
end