require 'rails_helper'

RSpec.describe About, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:description) }
    # Add other Shoulda Matchers as needed
  end

  # Other tests...
  describe '#validate_image_format' do
    context 'when image is attached' do
      let(:model) { described_class.new }
      let(:image_path) { Rails.root.join('spec', 'fixtures', 'files', 'example.jpg') }

      before do
        model.image.attach(io: File.open(image_path), filename: 'example.jpg', content_type: 'image/jpeg')
      end
    end
  end
  it 'does not add errors when content type is valid' do
    model.validate_image_format
    expect(model.errors[:image]).to be_empty
  end
end