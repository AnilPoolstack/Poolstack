class ServiceSerializer < ActiveModel::Serializer
  attributes :id, :service_name, :service_description, :category, :service_image_url
  include Rails.application.routes.url_helpers
  def service_image_url
    base_url3 = (Rails.env.development? || Rails.env.test?) ? "localhost:3000" : ENV['base_url']
    if object.service_image.attached?
      base_url3 +rails_blob_url(object.service_image, only_path: true)
    else
      nil
    end
  end
end
