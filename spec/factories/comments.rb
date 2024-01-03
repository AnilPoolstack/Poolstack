FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    email { Faker::Internet.email }
    blog_id { 1 }
    association :blog 
  end
end