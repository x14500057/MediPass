class MedicalRecordsController < ApplicationController
	before_action :set_medical_record, only: [:show, :edit, :update, :destroy]

	def index
		@patient = Patient.find_by_user_id(current_user.id)
		@medical_records = @patient.medical_records
	end

	def show
		@medical_record = MedicalRecord.find(params[:id])
	end

	# GET /doctors/1/edit
  def edit
  end

   # GET /patients/new
  def new
    # puts("\n\n\n test1 - create method \n\n\n")
    @medical_record = MedicalRecord.new 
    puts("\n\n\n doctor_id"+session[:doctor_id].to_s+"\n\n")
    respond_to do |format|
    format.html # new.html.erb 
    format.json {
    render json: @medical_record } 
    end
  end

  # POST /prescriptions
  # POST /prescriptions.json
  def create
    puts("\n\n\n doctor_id"+session[:doctor_id].to_s+"\n\n")
    puts("\n\n\n doctor_id"+session[:patient_id].to_s+"\n\n")
    puts("\n\n\n test1 - create method \n\n\n")
    @medical_record = MedicalRecord.new(medical_record_params)

    respond_to do |format|
      if @medical_record.save
        format.html { redirect_to @medical_record, notice: 'Medical Record was successfully created.' }
        format.json { render :show, status: :created, location: @medical_record }
      else
        format.html { render :new }
        format.json { render json: @medical_record.errors, status: :unprocessable_entity }
      end
    end
  end   
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_medical_record
    @medical_record = MedicalRecord.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def medical_record_params
    params.require(:medical_record).permit(:diagnostic, :symptoms, :treatment, :date).merge(patient_id: session[:patient_id], doctor_id: session[:doctor_id])
  end
end
