class MedicalRecordsController < ApplicationController

	def index
		# @patient = Patient.find_by(params[current_user.id]
		@user = User.find_by(params[current_user.id])
		@patient = @user.patient
		@medical_records = @patient.medical_records
	end

	def show
		@medical_record = MedicalRecord.find(params[:id])
	end

	# GET /doctors/1/edit
  def edit
  end

   def new
    @medical_record = MedicalRecord.new
  end
end
