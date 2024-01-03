FactoryBot.define do
    factory :service do
      service_name{ Faker::Internet.name }
      service_description { Faker::Lorem.paragraph }
      service_image {Rack::Test::UploadedFile.new(File.open('app/assets/image/aa.jpg')) }
      association :category, factory: :category
    end
  end