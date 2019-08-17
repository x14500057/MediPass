FactoryBot.define do 
  factory :user do
    sequence(:firstname) { |n| "test#{n}" }
    sequence(:surname) { |n| "test#{n}" }
    sequence(:phone_number) { |n| "12345678" }
    sequence(:address) { |n| "address#{n}" }
    datebirth { rand(1..100).days.from_now }
    user
  end
end

