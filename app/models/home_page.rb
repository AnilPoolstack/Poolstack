class HomePage < ApplicationRecord
    has_one_attached :logo_image
    has_one_attached :background_image

    validates :company_name,presence: true
    validates :company_name,length: { minimum: 3 }
end
