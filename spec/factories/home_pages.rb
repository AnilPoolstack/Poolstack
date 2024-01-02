FactoryBot.define do
  factory :home_page do
    company_name { Faker::Company.unique.company_name }
    content { Faker::Lorem.paragraph }
    logo_image { Rack::Test::UploadedFile.new(File.open('/home/poolstack/Pictures/1.jpg'), 'image/jpg') }
    background_image { Rack::Test::UploadedFile.new(File.open('/home/poolstack/Pictures/1.jpg'), 'image/jpg') }
  end
end
