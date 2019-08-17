json.extract! doctor, :id, :firstname, :surname, :address, :phone_number, :user, :references, :created_at, :updated_at
json.url doctor_url(doctor, format: :json)
