FactoryBot.define do
  factory :service do
    service_name{ Faker::Internet.name }
    service_description { Faker::Lorem.paragraph }
    category { %i[frontend_development backend_development devops].sample }
  end
end