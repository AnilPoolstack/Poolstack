FactoryBot.define do
    factory :HomePage do
    company_name { Faker::Company.unique.company_name }
    content { Faker::Lorem.paragraph }
   end
  end