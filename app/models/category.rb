class Category < ApplicationRecord
    has_many :services
    validates :name, presence: {message: "Can't be blank" }, length: { minimum: 1, maximum: 25, message: "should be between 1 and 25 characters" }
end
