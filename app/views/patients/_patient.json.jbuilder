json.extract! patient, :id, :firstname, :surname, :phone_number, :address, :datebirth, :user_id, :created_at, :updated_at
json.url patient_url(patient, format: :json)
