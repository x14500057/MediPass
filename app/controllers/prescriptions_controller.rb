class PrescriptionsController < ApplicationController
  before_action :set_prescription, only: [:show, :edit, :update, :destroy]


  #create new prescription method
  def create

        #grab the medical record object by its id and store in local variable
        @medical_record = MedicalRecord.find(params[:medical_record_id])

        #grab the associated patient by find the id sotred in the session
        @patient = Patient.find_by(params[session[:patient_id]])

        #grab all allergies associated with the patient
        @allergies = @patient.allergies

        #grab the result from the check_allergy method by passing in two parameters;
        #1. the prescribed drug
        #2. the patients allergies

        @allergies.each do |allergy| 
            puts("\n"+allergy.allergy_name.to_s+"\n")
        end
        
        

        drug_name = prescription_params[:drug_name]

        puts("\n\n"+drug_name)

        @result = Checkallergy.check_allergy("#{drug_name}", @allergies)
        puts("\n\n response:"+ @result.to_s+"\n\n")

        #set the status code and status message to local variables accordingly
        @status_code = @result[:status_code]
        @status_message = @result[:status_message]

        puts("\n\n code:"+ @status_code.to_s+"\n\n")

        puts("\n\n message:"+ @status_message+"\n\n")

        if @status_code.eql? 1
           respond_to do |format|
           format.html { redirect_to @medical_record }
           flash[:danger] = @status_message
         end
        else
          @prescriptions = @medical_record.prescriptions.create(params[:prescription].permit(:drug_name, :drug_strength, :drug_code))
          redirect_to medical_record_path(@medical_record)
          flash[:success] = "Prescription successfully added: "+@status_message
        end

        



    # respond_to do |format|
    #   if @medical_record.save
    #     format.html { redirect_to @medical_record, notice: 'Medical Record was successfully created.' }
    #     format.json { render :show, status: :created, location: @medical_record }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @medical_record.errors, status: :unprocessable_entity }
    #   end
    # end
    
        
    end


    def destroy
        @medical_record = MedicalRecord.find(params[:medical_record_id])
        @prescription = @medical_record.prescriptions.find(params[:id])
        @prescription.destroy
        flash[:success] = " Prescription successfully deleted"
        redirect_to medical_record_path(@medical_record)
    end

  # GET /prescriptions/1
  # GET /prescriptions/1.json
  def show
  end

  # GET /prescriptions/new
  def new
    @prescription = Prescription.new
  end

  # GET /prescriptions/1/edit
  def edit
  end

  # POST /prescriptions
  # POST /prescriptions.json
  # def create
  #   @prescription = Prescription.new(prescription_params)

  #   respond_to do |format|
  #     if @prescription.save
  #       format.html { redirect_to @prescription, notice: 'Prescription was successfully created.' }
  #       format.json { render :show, status: :created, location: @prescription }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @prescription.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # PATCH/PUT /prescriptions/1
  # PATCH/PUT /prescriptions/1.json
  def update
    respond_to do |format|
      if @prescription.update(prescription_params)
        format.html { redirect_to @prescription, notice: 'Prescription was successfully updated.' }
        format.json { render :show, status: :ok, location: @prescription }
      else
        format.html { render :edit }
        format.json { render json: @prescription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prescriptions/1
  # DELETE /prescriptions/1.json
  # def destroy
  #   @prescription.destroy
  #   respond_to do |format|
  #     format.html { redirect_to prescriptions_url, notice: 'Prescription was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prescription
      @prescription = Prescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prescription_params
      params.require(:prescription).permit(:drug_name, :drug_strength, :drug_code, :patient_id, :doctor_id)
    end
end
