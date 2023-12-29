FactoryBot.define do
  factory :blog do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    company_name { Faker::Company.name }
    # logo_image { Faker::Internet.url }
    # blog_image { Faker::Internet.url } 
  end
end
