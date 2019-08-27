json.extract! prescription, :id, :drug_name, :drug_strength, :drug_code, :patient_id, :doctor_id, :created_at, :updated_at
json.url prescription_url(prescription, format: :json)
