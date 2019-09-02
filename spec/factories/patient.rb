FactoryBot.define do 
  factory :patient do
    sequence(:firstname) { |n| "test#{n}" }
    sequence(:surname) { |n| "test#{n}" }
    sequence(:phone_number) { |n| "12345678910" }
    sequence(:address) { |n| "addressaddress#{n}" }
    datebirth { rand(1..100).days.from_now }
    user
  end
end

