require 'rails_helper'

RSpec.describe Service, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it"To check the presence of name " do
    service=Service.new(service_name: nil)
    expect(service.valid?).to eq(false)
  end

  it"To check the presence of description " do
    service=Service.new(service_description: nil)
    expect(service.valid?).to eq(false)
  end

  it"To check the presence of image " do
    service=Service.new(service_image: nil)
    expect(service.valid?).to eq(false)
  end

  context "validation" do
    it "To check the minimum length of service_name" do
      service = Service.new(service_name: 'a')
      service.valid?
      expect(service.errors[:service_name]).to include("should be between 2 and 35 characters")
    end

    it "To check the maximum length of service_name" do
      service = Service.new(service_name: 'a' * 36)
      service.valid?
      expect(service.errors[:service_name]).to include("should be between 2 and 35 characters")
    end
  end

  context "validation" do
    it "To check the service_name allows only letters and spaces" do
      valid_service = Service.new(service_name: 'Valid Service Name')
      expect(valid_service.valid?).to eq(false)
    end

    it "To check the service_name does not allow special characters" do
      invalid_service = Service.new(service_name: 'Invalid-Service')
      invalid_service.valid?
      expect(invalid_service.errors[:service_name]).to include("only allows letters and spaces")
    end

    it "To check the service_name does not allow numbers" do
      invalid_service = Service.new(service_name: 'Service123')
      invalid_service.valid?
      expect(invalid_service.errors[:service_name]).to include("only allows letters and spaces")
    end
  end

  it 'To check the validation when creating a new Service' do
    service = Service.new(category_id:1, service_name: 'Valid Service Name', service_description: 'Valid service description within limits',service_image: Rack::Test::UploadedFile.new(Rails.root.join('app/assets/image/aa.jpg'), 'image/jpg'))
    expect(service.valid?).to eq(false)
  end
  
end
