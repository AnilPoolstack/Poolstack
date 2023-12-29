FactoryBot.define do
  factory :service do
    service_name { Faker::Lorem.words(number: 3).join(' ') }
    service_description { Faker::Lorem.sentence }
    category { %i[frontend_development backend_development devops].sample }
  end
end