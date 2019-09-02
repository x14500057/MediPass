class MedicalRecord < ApplicationRecord
	belongs_to :patient
	belongs_to :doctor
	has_many :prescriptions 



  scope :search, -> (search) do
    where("diagnostic ILIKE lower(?) OR symptoms ILIKE lower(?)", "%#{search}%", "%#{search}%")
  end
end
