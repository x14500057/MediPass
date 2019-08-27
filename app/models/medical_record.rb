class MedicalRecord < ApplicationRecord
	belongs_to :patient
	belongs_to :doctor
	has_many :prescriptions 
end
