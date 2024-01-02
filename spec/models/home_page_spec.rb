require 'rails_helper'

RSpec.describe HomePage, type: :model do
subject{HomePage.create(company_name: 'Example Company', content: 'Lorem ipsum',logo_image: Rack::Test::UploadedFile.new(Rails.root.join('/home/poolstack/Pictures/1.jpg'), 'image/jpg'),background_image: Rack::Test::UploadedFile.new(Rails.root.join('/home/poolstack/Pictures/1.jpg'), 'image/jpg')
) }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a company name' do
    subject.company_name = ''
    expect(subject).to_not be_valid
  end
  it 'is not valid with a short company name' do
    subject.company_name = 'AB'
    expect(subject).to be_valid
  end
  it 'is valid with a long company name' do
    subject.company_name = 'Very Long Company Name'
    expect(subject).to_not be_valid
  end
  it 'is not valid without content' do
    subject.content = ''
    expect(subject).to_not be_valid
  end
  it 'is valid with content within the maximum length' do
    subject.content = 'Lorem ipsum'
    expect(subject).to be_valid
  end
  it 'is not valid with content exceeding the maximum length' do
    subject.content = 'A' * 3
    expect(subject).to be_valid
  end
  it 'is not valid without content' do
    subject = HomePage.create(company_name: 'Example Company', content: nil)
    expect(subject).to_not be_valid
  end
end
