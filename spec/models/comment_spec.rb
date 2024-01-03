require 'rails_helper'

RSpec.describe Comment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'validations' do
    it 'validation for content presence' do
      comment=Comment.new(content:nil)
      expect(comment.valid?).to eq(false)
    end
    it 'validates the email format' do
      comment = Comment.new(email: 'invalid_email_format')
      comment.valid?

      expect(comment.errors[:email]).to include('Invalid email format')
    end
    it 'validates the presence of email' do
      comment = Comment.new(email: '')
      comment.valid?

      expect(comment.errors[:email]).to include("can't be blank")
    end
    it 'accepts valid email format' do
      comment = Comment.new(email: 'valid@example.com')
      comment.valid?

      expect(comment.errors[:email]).to_not include('Invalid email format')
    end
    
    it "To check the minimum length of content" do
      comment = Comment.new(content: 'a' * 1 )
      comment.valid?
      expect(comment.errors[:content]).to include("should be between 2 and 1000 characters")
    end
  
    it "To check the maximum length of content" do
      comment = Comment.new(content: 'a' * 1001 )
      comment.valid?
      expect(comment.errors[:content]).to include("should be between 2 and 1000 characters")
    end
  end

  describe 'associations' do
    it { should belong_to(:blog) }
  end
  
end
