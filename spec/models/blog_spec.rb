require 'rails_helper'

RSpec.describe Blog, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject {
    described_class.new(company_name: "Poolstack Technologies", title: 'Web Development', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom")
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

  it "should not valid without presence" do
    blog = Blog.new()
    expect(blog.save).to eq(false)
  end

  it "should be valid with presence" do
    blog = Blog.new(company_name: "Poolstack Technologies", title: 'Web Development', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom")
    expect(blog.save).to eq(true)
  end

  it "should not valid without format" do
    blog = Blog.new(company_name: "7478274@hshs", title: '827@udjfuhudfh', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom")
    expect(blog.save).to eq(false)
  end

  it "should valid with format" do
    blog = Blog.new(company_name: "Poolstack Technologies", title: 'Web Development', description: "abcdhdhjfsjkfjsdfsikjsfhdjfhsdjfhdsjfhskjdhjdhcom")
    expect(blog.save).to eq(true)
  end

end
