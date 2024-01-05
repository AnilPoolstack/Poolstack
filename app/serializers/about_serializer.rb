class AboutSerializer < ActiveModel::Serializer
  attributes :id, :description, :image


  include Rails.application.routes.url_helpers
  def image
    base_url = (Rails.env.development? || Rails.env.test?) ? "localhost:3000" : ENV['base_url']
    if object.image.attached?
      base_url +rails_blob_url(object.image, only_path: true)
    else
      nil
    end
  end
end
