class BlogSerializer < ActiveModel::Serializer
  attributes :id, :logo_image_url, :company_name, :title, :description, :blog_image_url

  include Rails.application.routes.url_helpers
  def blog_image_url
    base_url = (Rails.env.development? || Rails.env.test?) ? "localhost:3000" : ENV['base_url']
    if object.blog_image.attached?
      base_url +rails_blob_url(object.blog_image, only_path: true)
    else
      nil
    end
  end

  def logo_image_url
    base_url2 = (Rails.env.development? || Rails.env.test?) ? "localhost:3000" : ENV['base_url2']
    if object.logo_image.attached?
      base_url2 +rails_blob_url(object.logo_image, only_path: true)
    else
      nil
    end
  end
end
