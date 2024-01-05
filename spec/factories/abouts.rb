FactoryBot.define do
    factory :about do
      description { Faker::Lorem.paragraph }
      image { Rack::Test::UploadedFile.new(File.open('app/assets/image/aa.jpg')) }
    end
  end