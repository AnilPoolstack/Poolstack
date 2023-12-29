class Contact < ApplicationRecord
    validates :full_name, :email, :contact_number, presence: true
    validates :full_name, format: { with: /\A[a-z A-Z]+\z/, message: "only allows letters" }
    validates :email, uniqueness: { message: "email must be unique" }
    validates :contact_number, length: { minimum: 10 }, uniqueness: { message: "Already Taken" }
  end
  