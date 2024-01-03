require 'rails_helper'
RSpec.describe Contact, type: :model do
    context 'when all required fields are present and valid' do
      it 'is valid' do
        contact = Contact.new(
          full_name: 'John Doe',
          email: 'john.doe@example.com',
          message: 'Hello!',
          contact_number: 1234567890,
          country_code: 91
        )
        expect(contact).to be_valid
      end
    end
  
    context 'when required fields are missing or invalid' do
      it 'is invalid without full_name' do
        contact = Contact.new(
          email: 'john.doe@example.com',
          message: 'Hello!',
          contact_number: 1234567890,
          country_code: 91
        )
        expect(contact).to be_invalid
      end
  
      it 'is invalid with non-letter characters in full_name' do
        contact = Contact.new(
          full_name: 'John123',
          email: 'john.doe@example.com',
          message: 'Hello!',
          contact_number: 1234567890,
          country_code: 91
        )
        expect(contact).to be_invalid
      end
  
      it 'is invalid with an invalid email format' do
        contact = Contact.new(
          full_name: 'John Doe',
          email: 'invalid-email',
          message: 'Hello!',
          contact_number: 1234567890,
          country_code: 91
        )
        expect(contact).to be_invalid
      end
  
      it 'is invalid with a contact_number outside the specified length range' do
        contact = Contact.new(
          full_name: 'John Doe',
          email: 'john.doe@example.com',
          message: 'Hello!',
          contact_number: 123,
          country_code: 91
        )
        expect(contact).to be_invalid
      end
    end
  end
  