class Blog < ApplicationRecord
    has_one_attached :logo_image
    has_one_attached :blog_image
    has_many :comments
    validates :title, :description, :company_name, :logo_image, :blog_image, presence: true
    validates :title, :company_name, format: { with: /\A[a-z A-Z]+\z/, message: "only allows letters" }
    validates :title, length: { minimum: 4, maximum: 50, message: "should be between 4 and 50 characters" }
    validates :company_name, length: { minimum: 4, maximum: 35, message: "should be between 4 and 35 characters" }
    validates :description, length: { minimum: 4, message: "should be minimum 4 characters" }
    
    validate :validate_logo_image_content_type 
    validate :validate_blog_image_content_type
    private
    def validate_logo_image_content_type
        allowed_types = %w(image/jpeg image/png image/jpg image/gif)
        unless logo_image.attached? && logo_image.content_type.in?(allowed_types)
            errors.add(:logo_image, 'must be an allowed image type (JPEG or PNG, GIF or JPG)')
        end
    end 

    def validate_blog_image_content_type
        allowed_types = %w(image/jpeg image/png image/jpg image/gif)
        unless blog_image.attached? && blog_image.content_type.in?(allowed_types)
            errors.add(:blog_image, 'must be an allowed image type (JPEG or PNG, GIF or JPG)')
        end
    end 
end