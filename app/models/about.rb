class About < ApplicationRecord
  has_one_attached :image
  
  validate :validate_image_format

private

def validate_image_format
  return unless image.attached?

  allowed_formats = %w[jpg jpeg png]
  extension = image.blob.filename.extension&.downcase

  unless extension.present? && allowed_formats.include?(extension)
    errors.add(:image, 'must be a valid image format (jpg, jpeg, png)')
  end
end
  validates :description,:image, presence:true
end
