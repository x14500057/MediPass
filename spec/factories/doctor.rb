FactoryBot.define do 
  factory :user do
    sequence(:firstname) { |n| "test#{n}" }
    sequence(:surname) { |n| "test#{n}" }
    sequence(:address) { |n| "address#{n}" }
    sequence(:phone_number) { |n| "12345678" }

    user
  end
end

  