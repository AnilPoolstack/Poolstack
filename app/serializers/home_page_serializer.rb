class HomePageSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :logo_image_url, :background_image_url, :content

    include Rails.application.routes.url_helpers
  def logo_image_url
    base_url = (Rails.env.development? || Rails.env.test?) ? "localhost:3000" : ENV['base_url']
    if object.logo_image.attached?
      base_url +rails_blob_url(object.logo_image, only_path: true)
    else
      nil
    end
  end

    def background_image_url
    base_url = (Rails.env.development? || Rails.env.test?) ? "localhost:3000" : ENV['base_url']
    if object.background_image.attached?
      base_url +rails_blob_url(object.background_image, only_path: true)
    else
      nil
    end
  end
end
