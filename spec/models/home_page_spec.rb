require 'rails_helper'

RSpec.describe HomePage, type: :model do
  subject { HomePage.create(company_name: "Example Company" ) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a company name" do
    subject.company_name = ""
    expect(subject).to_not be_valid
  end

  it "is not valid with a short company name" do
    subject.company_name = "AB" # Assuming a minimum length of 3 characters
    expect(subject).to_not be_valid
  end

  it "is valid with a long company name" do
    subject.company_name = "Very Long Company Name"
    expect(subject).to be_valid
  end

  it "is not valid without a company name" do
    subject = HomePage.create(company_name: "")
    subject.company_name = nil
    expect(subject).to_not be_valid
  end

end
