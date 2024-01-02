require 'rails_helper'

RSpec.describe About, type: :model do
  describe '#validate_image_format' do
    context 'when image is attached' do
      let(:about) { described_class.new }
      let(:image_path) { Rails.root.join('spec', 'fixtures', 'files', 'g1.jpg') }

      before do
        about.image.attach(io: File.open(image_path), filename: 'g1.jpg', content_type: 'image/jpg')
      end

      it 'does not add errors when content type is valid' do
        about.send(:validate_image_format)  # Use send to invoke private method
        expect(about.errors[:image]).to be_empty
      end
    end
    # it 'does not add an error for valid image format' do
    #   about = build(:about)  # Ensure 'about' is defined in the current example
    #   image_path = 'path/to/image.jpg'
    #   about.image.attach(io: File.open(image_path), filename: 'g1.jpg')
    #   about.validate_image_format
    #   expect(about.errors[:image]).to be_empty
    # end
  end
end