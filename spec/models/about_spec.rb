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
    it "is invalid without an image" do
      about = FactoryBot.build(:about, image: nil)
      about.valid?
      expect(about.errors[:image]).to include("can't be blank")
    end

    # it "is valid with an image" do
    #   about = FactoryBot.build(:about)
    #   expect(about).to be_valid
    # end
    it "is invalid without an image and returns the expected error message" do
      about = FactoryBot.build(:about, image: nil)
      about.valid?

      expect(about).not_to be_valid
      expect(about.errors[:image]).to include("can't be blank")
    end
  end
end