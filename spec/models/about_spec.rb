require 'rails_helper'

RSpec.describe About, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'is not valid without a description' do
    about_us = build(:about_us, description: nil)
    expect(about_us).not_to be_valid
    expect(about_us.errors[:description]).to include("can't be blank")
  end
end
