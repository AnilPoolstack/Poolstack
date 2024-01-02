FactoryBot.define do
  factory :blog do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    company_name { Faker::Company.name }
    logo_image { Rack::Test::UploadedFile.new(File.open('/home/poolstack/Downloads/2.jpg')) }
    blog_image { Rack::Test::UploadedFile.new(File.open('/home/poolstack/Downloads/2.jpg')) }
  end
end
