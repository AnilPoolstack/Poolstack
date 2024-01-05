require 'rails_helper'

RSpec.describe Blog, type: :model do


  subject {
    described_class.new(company_name: "Poolstack Technologies", title: 'Web Development', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom",logo_image: Rack::Test::UploadedFile.new(Rails.root.join('app/assets/image/aa.jpg'), 'image/jpg'),
    blog_image: Rack::Test::UploadedFile.new(Rails.root.join('app/assets/image/aa.jpg'), 'image/jpg'))
  }

  it "should be valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "should not valid without a title" do
    subject.title = "Web Development"
    expect(subject).to be_valid
  end

  it "should not valid without a company_name" do
    subject.company_name = nil
    expect(subject).to_not be_valid
  end

  it "should not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "should not valid without a blog_image" do
    subject.blog_image = nil
    expect(subject).to_not be_valid
  end

  it "should not valid without a logo_image" do
    subject.logo_image = nil
    expect(subject).to_not be_valid
  end

  it "should not valid without presence" do
    blog = Blog.new()
    expect(blog.save).to eq(false)
  end

  it "should be valid with presence" do
    blog = Blog.new(company_name: "Poolstack Technologies", title: 'Web Development', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom", blog_image: Rack::Test::UploadedFile.new(Rails.root.join('app/assets/image/aa.jpg'), 'image/jpg'),logo_image: Rack::Test::UploadedFile.new(Rails.root.join('app/assets/image/aa.jpg'), 'image/jpg'))
    expect(blog.save).to eq(true)
  end

  it "should not valid without format" do
    blog = Blog.new(company_name: "7478274@hshs", title: '827@udjfuhudfh', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom")
    expect(blog.save).to eq(false)
  end

  it "should valid with format" do
    blog = Blog.new(company_name: "Poolstack Technologies", title: 'Web Development', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom", blog_image: Rack::Test::UploadedFile.new(Rails.root.join('app/assets/image/aa.jpg'), 'image/jpg'),logo_image: Rack::Test::UploadedFile.new(Rails.root.join('app/assets/image/aa.jpg'), 'image/jpg'))
    expect(blog.save).to eq(true)
  end

  # describe 'validations' do

  #       before(:each) do
  #         @blog = FactoryBot.build(:blog, company_name: "Poolstack Technologies", title: 'Web Development', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom", blog_image: Rack::Test::UploadedFile.new(Rails.root.join('/home/poolstack/Downloads/2.jpg'), 'image/jpg'),logo_image: Rack::Test::UploadedFile.new(Rails.root.join('/home/poolstack/Downloads/2.jpg'), 'image/jpg'))
  #         @blog.save
  #       end

  #   # let(:blog) { build(:blog) }
  #   describe 'validate_logo_image_content_type' do
  #     it 'adds an error if logo_image is not an allowed content type' do
  #       @blog.logo_image.attach(io: File.open('/home/poolstack/2.txt'), filename: 'image.txt', content_type: 'text/plain')
  #       @blog.validate_logo_image_content_type
  #       expect(@blog.errors[:logo_image]).to include('must be a JPEG, JPG, GIF or PNG')
  #     end
  #     it 'does not add an error if logo_image is an allowed content type' do
  #       @blog.logo_image.attach(io: File.open('/home/poolstack/Downloads/2.jpg'), filename: 'image.jpg', content_type: 'image/jpg')
  #       @blog.validate_logo_image_content_type
  #       expect(@blog.errors[:logo_image]).to be_empty
  #     end
  #   end
  #   describe 'validate_blog_image_content_type' do
  #     it 'adds an error if blog_image is not an allowed content type' do
  #       @blog.blog_image.attach(io: File.open('/home/poolstack/2.txt'), filename: 'image.txt', content_type: 'text/plain')
  #       @blog.validate_blog_image_content_type
  #       expect(@blog.errors[:blog_image]).to include('must be a JPEG, JPG, GIF or PNG')
  #     end
  #     it 'does not add an error if blog_image is an allowed content type' do
  #       @blog.blog_image.attach(io: File.open('/home/poolstack/Downloads/2.jpg'), filename: 'image.jpg', content_type: 'image/jpg')
  #       @blog.validate_blog_image_content_type
  #       expect(@blog.errors[:blog_image]).to be_empty
  #     end
  #   end
  # end

end
