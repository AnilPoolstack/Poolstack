class HomePage < ApplicationRecord
  has_one_attached :logo_image
  has_one_attached :background_image
  validates :company_name, presence: true, length: { minimum: 1, maximum: 20 }
  validates :content, presence: true, length: { minimum: 2, maximum: 200 }
  validates :logo_image, presence: { message: 'logo image must be attached' }
  validates :background_image, presence: { message: 'background image must be attached' }
  validate :validate_logo_image_content_type
  validate :validate_background_image_content_type

  private

  def validate_logo_image_content_type
    allowed_types = %w(image/jpeg image/png image/jpg)
    unless logo_image.attached? && logo_image.content_type.in?(allowed_types)
      errors.add(:logo_image, 'must be an allowed image type (JPEG or PNG or JPG)')
    end
  end

  def validate_background_image_content_type
    allowed_types = %w(image/jpeg image/png image/jpg)
    unless background_image.attached? && background_image.content_type.in?(allowed_types)
      errors.add(:background_image, 'must be an allowed image type (JPEG or PNG or JPG)')
    end
  end
end

