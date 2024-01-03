require 'rails_helper'

RSpec.describe Category, type: :model do
  # debugger
  it"To check the presence of name " do
    category=Category.new(name: nil)
    expect(category.valid?).to eq(false)
  end

  context "validation" do
    it "To check the minimum length of name" do
      category = Category.new(name: nil)
      category.valid?
      expect(category.errors[:name]).to include("should be between 1 and 25 characters")
    end

    it "To check the maximum length of name" do
      category = Category.new(name: 'a' * 26)
      category.valid?
      expect(category.errors[:name]).to include("should be between 1 and 25 characters")
    end
  end

end
