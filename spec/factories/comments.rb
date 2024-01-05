FactoryBot.define do
 
  factory :comment do
    content { Faker::Lorem.paragraph }
    email { Faker::Internet.email }
    association :blog, factory: :blog
  end
end