FactoryBot.define do
  factory :blog do
    title { "tydyt fc" }
    description { Faker::Lorem.paragraph }
    company_name { "tdfty tdfty" }
    logo_image { Rack::Test::UploadedFile.new(File.open('/home/poolstack/Downloads/f4.jpeg')) }
    blog_image { Rack::Test::UploadedFile.new(File.open('/home/poolstack/Downloads/f4.jpeg')) }
  end
end
