FactoryBot.define do
    factory :comment do
      content { 'Sample Comment Content' }
      email { 'example@example.com' }
      blog_id {1}
      association :blog # Asuming there's a Blog model and comments belong to blogs
    end
end