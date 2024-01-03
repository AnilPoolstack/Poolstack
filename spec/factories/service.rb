FactoryBot.define do
    factory :service do
      service_name{ Faker::Internet.name }
      service_description { Faker::Lorem.paragraph }
      category { %i[frontend_development backend_development devops].sample }
      service_image {Rack::Test::UploadedFile.new(File.open('app/assets/image/aa.jpg')) }
    end
  end