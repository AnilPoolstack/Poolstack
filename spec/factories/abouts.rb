FactoryBot.define do
    factory :about do
      description { 'Sample Description' }
      # image { Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/home/Poolstack/Downloads/g1.jpg'))) }
      # Other attributes as needed
      image {nil}
    end
  end