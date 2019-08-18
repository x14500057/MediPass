class MedicalRecordsController < ApplicationController

	def show
		@medical_record = MedicalRecord.find(params[:id])
	end
end
