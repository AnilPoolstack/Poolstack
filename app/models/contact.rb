class Contact < ApplicationRecord
  validates :full_name, :email, :message, :contact_number, presence: true
  validates :full_name, format: { with: /\A[a-z A-Z]+\z/, message: "Only Allows Letters" }
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid Email Format" }
  validates :contact_number, length: { in: 10..15, message: "Please Enter Valid Contact Number" }
end
