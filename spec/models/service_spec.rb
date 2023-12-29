require 'rails_helper'

RSpec.describe Service, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

it"To check the presence of name " do
  service=Service.new(service_name: nil)
  expect(service.valid?).to eq(false)
end

it"To check the presence of category " do
  service=Service.new(category: nil)
  expect(service.valid?).to eq(false)
end

it"To check the presence of description " do
  service=Service.new(service_description: nil)
  expect(service.valid?).to eq(false)
end

context "validation" do
  it "To check the minimum length of service_name" do
    service = Service.new(service_name: 'a')
    service.valid?
    expect(service.errors[:service_name]).to include("should be between 2 and 50 characters")
  end

  it "To check the maximum length of service_name" do
    service = Service.new(service_name: 'a' * 51)
    service.valid?
    expect(service.errors[:service_name]).to include("should be between 2 and 50 characters")
  end
end

context "validation" do
  it "To check the minimum length of service_description" do
    service = Service.new(service_description: 'a' * 4 )
    service.valid?
    expect(service.errors[:service_description]).to include("should be between 5 and 200 characters")
  end

  it "To check the maximum length of service_description" do
    service = Service.new(service_description: 'a' * 201)
    service.valid?
    expect(service.errors[:service_description]).to include("should be between 5 and 200 characters")
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
  service = Service.new(category: :frontend_development, service_name: 'Valid Service Name', service_description: 'Valid service description within limits')
  expect(service.valid?).to eq(true)
end



end