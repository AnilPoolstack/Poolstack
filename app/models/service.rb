class Service < ApplicationRecord
    enum :category, [:frontend_development, :backend_development, :devops]
    validates :category, presence: { message: "Can't be blank" }
    validates :service_description, presence: { message: "Can't be blank" }
    validates :service_name, presence: { message: "Can't be blank" },format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" },
    length: { minimum: 2, maximum: 50, message: "should be between 2 and 50 characters" }
    validates :service_description, length: { minimum: 5, maximum: 200, message: "should be between 5 and 200 characters" }
end