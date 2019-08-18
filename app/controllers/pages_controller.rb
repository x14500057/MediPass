class PagesController < ApplicationController

	def index
		@medical_records = MedicalRecord.limit(5)
	end

end
