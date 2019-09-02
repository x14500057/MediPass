class AllergiesController < ApplicationController
  before_action :set_allergy, only: [:show, :edit, :update, :destroy]

  # GET /allergies
  # GET /allergies.json
  def index
    patient = Patient.find_by(params[session[:patient_id]])
    allergies = @patient.allergies
  end

  # GET /allergies/1
  # GET /allergies/1.json
  def show
  end

  # GET /allergies/new
  def new
    @allergy = Allergy.new
  end

  # GET /allergies/1/edit
  def edit
  end

  # POST /allergies
  # POST /allergies.json
  def create

    #grab the medical record object by its id and store in local variable
        # @patient_id = MedicalRecord.find(params[:medical_record_id])

        #grab the associated patient by find the id sotred in the session
        @patient = Patient.find_by(params[session[:patient_id]])

        #grab all allergies associated with the patient
        @allergies = @patient.allergies

  
          @allergies = @patient.allergies.create(params[:allergy].permit(:allergy_name))
          redirect_to patient_path(@patient)
          flash[:success] = " Prescription successfully added"
    
  end


  

  # PATCH/PUT /allergies/1
  # PATCH/PUT /allergies/1.json
  def update
    respond_to do |format|
      if @allergy.update(allergy_params)
        format.html { redirect_to @allergy, notice: 'Allergy was successfully updated.' }
        format.json { render :show, status: :ok, location: @allergy }
      else
        format.html { render :edit }
        format.json { render json: @allergy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allergies/1
  # DELETE /allergies/1.json
  def destroy

    @patient = Patient.find(params[:patient_id])
        @allergy = @patient.allergies.find(params[:id])
        @allergy.destroy
        flash[:success] = " Allergy successfully deleted"
        redirect_to patient_path(@patient)
     
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allergy
      @allergy = Allergy.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allergy_params
      params.require(:allergy).permit(:allergy_name, :patient_id)
    end
end
