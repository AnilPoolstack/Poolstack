class Service < ApplicationRecord
  belongs_to :category
  validates :service_description, presence: { message: "Can't be blank" }
  validates :service_name, presence: { message: "Can't be blank" },format: { with: /\A[a-z A-Z\s]+\z/, message: "only allows letters and spaces" },length: { minimum: 2, maximum: 35, message: "should be between 2 and 35 characters" }
  has_one_attached :service_image
  validates :service_image, presence: true
  validate :validate_service_image_content_type

  private
  def validate_service_image_content_type
    allowed_types = %w(image/jpeg image/png image/jpg)
    unless service_image.attached? && service_image.content_type.in?(allowed_types)
      errors.add(:service_image, 'must be an allowed image type (JPEG or PNG or JPG)')
    end
  end
end