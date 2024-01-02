FactoryBot.define do
    factory :contact do
      full_name { 'John Doe' }
      email { 'john.doe@example.com' }
      contact_number { '1234567890' }
      message { 'Testing data' }
    end
  end