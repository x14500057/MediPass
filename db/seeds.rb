# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def seed_users
  user_id = 0

	10.times do 
		if user_id % 2 == 0 
  	
    User.create(
      email: "test#{user_id}@test.com",
      password: '123456',
      password_confirmation: '123456',
      role: "patient"
    )
    seed_patients(user_id)

	else 
	User.create(
      email: "test#{user_id}@test.com",
      password: '123456',
      password_confirmation: '123456',
      role: "doctor"
    )
    seed_doctors(user_id)
	end
    
    user_id = user_id + 1
  end
end

def seed_patients(user_id)
  user_id = user_id
  date =  rand(1..100).days.from_now

    Patient.create(
      firstname: "test#{user_id}",
      surname: "test#{user_id}@test.com",
      phone_number: '123456',
      address: '123456',
      datebirth: date,
      user_id: user_id
    )
end

def seed_doctors(user_id)
  user_id = user_id

    Doctor.create(
      firstname: "testDoctor#{user_id}",
      surname: "testDoctor#{user_id}",
      address: "address#{user_id}",
      phone_number: '123456',
      user_id: user_id
    ) 
end

def seed_medical_records
  patients = Patient.all
  date = rand(1..100).days.from_now 

  patients.each do |patient|
    5.times do
      MedicalRecord.create(
        diagnostic: Faker::Lorem.sentences[0], 
        symptoms: Faker::Lorem.sentences[0],
        treatment: Faker::Lorem.sentences[0], 
        date: date,
        doctor_id: rand(1..4), 
        patient_id: patient.id
      )
    end
  end
end


seed_users
seed_medical_records