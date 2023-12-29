class Blog < ApplicationRecord
    has_one_attached :logo_image
    has_one_attached :blog_image

end
