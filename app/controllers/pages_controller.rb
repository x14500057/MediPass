class PagesController < ApplicationController

	def index
		@medical_records = MedicalRecord.all
	end
end
