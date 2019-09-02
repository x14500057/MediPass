class MedicalRecordsController < ApplicationController
	before_action :set_medical_record, only: [:show, :edit, :update, :destroy]
  

	def index

    @patient = Patient.find_by(params[session[:patient_id]])
    @medical_records = @patient.medical_records
    @medical_records = @patient.medical_records.search(search)
    # @medical_records = @patient.medical_records.search(search)
    # search = params[:search]
    # # category = params[:category]
    # @medical_records = MedicalRecord.all.search(search)
    # @patient = Patient.find_by(params[session[:patient_id]])

    # @medical_records = @patient.medical_records.search(search)


    # @patient = Patient.find_by(params[current_user.id]
    # search = params[:search]
    # @user = User.find_by(params[current_user.id])
    # @patient = @user.patient
    # @medical_records = @patient.medical_records
    # @medical_records = @patient.medical_records.search(search)
  
    
	end

#   def get_medical_records

#     # branch = params[:action]
#     search = params[:search]
#     # category = params[:category]
#     @medical_records = MedicalRecord.all.search(search)
#     # if category.blank? && search.blank?
#     #   posts = Post.by_branch(branch).all
#     # elsif category.blank? && search.present?
#     #   posts = Post.by_branch(branch).search(search)
#     # elsif category.present? && search.blank?
#     #   posts = Post.by_category(branch, category)
#     # elsif category.present? && search.present?
#       # posts = Post.by_category(branch, category).search(search)
#     # else
#   # end
# end

	def show
		@medical_record = MedicalRecord.find(params[:id])
	end

	# GET /doctors/1/edit
  def edit
  end

   # GET /patients/new
  def new
    @medical_record = MedicalRecord.new 
    puts("\n\n\n doctor_id"+session[:doctor_id].to_s+"\n\n")
    puts("\n\n\n patient_id"+session[:patient_id].to_s+"\n\n")

    respond_to do |format|
    format.html # new.html.erb 
    format.json {
    render json: @medical_record } 
    end
  end

  # POST /prescriptions
  # POST /prescriptions.json
  def create
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

  # def medical_records_for_patient(patient)
  #   @patient = MedicalRecord.where(: branch)
  #   @posts = get_posts.paginate(page: params[:page])
  # end

  def get_medical_records
    MedicalRecord.limit(30)
  end
 

  # Never trust parameters from the scary internet, only allow the white list through.
  def medical_record_params
    params.require(:medical_record).permit(:diagnostic, :symptoms, :treatment, :date).merge(patient_id: session[:patient_id], doctor_id: session[:doctor_id])
  end
end
