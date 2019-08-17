FactoryGirl.define do 
  factory :medical_record do
    diagnostic 'a' * 20
    symptoms 'a' * 20
    treatment 'a' * 20
    date { rand(1..100).days.from_now }
    patient
    doctor
  end
end

