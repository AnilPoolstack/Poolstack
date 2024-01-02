class Blog < ApplicationRecord
    has_one_attached :logo_image
    has_one_attached :blog_image
    validates :title, :description, :company_name, presence: true
    validates :title, :company_name, format: { with: /\A[a-z A-Z]+\z/, message: "only allows letters" }
end
