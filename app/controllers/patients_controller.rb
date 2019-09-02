class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  # GET /patients
  # GET /patients.json
  def index
    @patients = Patient.all
    
    search = params[:search]
    # category = params[:category]
    @patients = Patient.all.search(search)
  end

  # GET /patients/1
  # GET /patients/1.json
  def show

    patient = Patient.find(params[:id])
    session[:patient_id] = patient.id
    @patient = PatientDecorator.new(patient)
    @medical_records = @patient.medical_records 
    @allergies = @patient.allergies 
    
  end

  # GET /patients/new
  def new
    @patient = Patient.new 
    @patient.user_id = current_user.id
    respond_to do |format|
    format.html # new.html.erb 
    format.json {
    render json: @patient } 
    end
  end

  # GET /patients/1/edit
  def edit
    
  end

  def signedinuserpatient
    @patient = Patient.find_by_user_id(current_user.id) 
    if @patient.nil?
      redirect_to "/patients/new"
    else
      redirect_to "/patients/#{@patient.id}" 
      flash[:info] = "Logged in as patient: " +@patient.firstname
    end
  end

  # POST /patients
  # POST /patients.json

  def create
    # result = CreatePatientProfile.call(Patient.new(patient_params))
    # if result.success?

    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient }
        flash[:success] = "Thank you "+@patient.firstname+". Your account has been setup."
      else
      format.html { render :new }
      format.json { render json: @patient.errors, status: :unprocessable_entity }
    end
  end
  end

  


  # def create
  #   @patient = Patient.new(patient_params)

  #   respond_to do |format|
  #     if @patient.save
        
  #       format.html { redirect_to @patient }
  #       flash[:success] = "Thank you "+@patient.firstname+". Your account has been setup."
        
  #       format.json { render :show, status: :created, location: @patient }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @patient.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient}
        flash[:success] = "Patient profile was successfully updated."
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: 'Patient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:firstname, :surname, :phone_number, :address, :datebirth, :search).merge(user_id: current_user.id)
    end
end
