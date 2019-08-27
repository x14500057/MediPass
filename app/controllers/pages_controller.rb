class PagesController < ApplicationController

	def index
		@medical_records = MedicalRecord.all
		@patient = Patient.find_by_user_id(1) 
	end
end
