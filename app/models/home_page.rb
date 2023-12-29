class HomePage < ApplicationRecord
    has_one_attached :logo_image
    has_one_attached :background_image
    validates :company_name,presence: true,length: { minimum: 1 }
    validates :content, presence: true,length: { minimum: 2 }
end
