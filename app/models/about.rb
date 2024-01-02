class About < ApplicationRecord
  has_one_attached :image
  validate :validate_image_format

  private

  def validate_image_format
    return unless image.attached?

    if image.content_type.nil?
      errors.add(:image, 'is missing content type!')
    elsif !image.content_type.in?(%w(image/jpeg image/png))
      errors.add(:image, 'needs to be a JPEG or PNG!')
    end
  end
  validates :description, presence:true
end
