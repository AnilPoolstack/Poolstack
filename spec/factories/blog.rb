FactoryBot.define do
  factory :blog do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    company_name { Faker::Company.name }
    logo_image { Rack::Test::UploadedFile.new(File.open('app/assets/image/aa.jpg')) }
    blog_image { Rack::Test::UploadedFile.new(File.open('app/assets/image/aa.jpg')) }
  end
end
