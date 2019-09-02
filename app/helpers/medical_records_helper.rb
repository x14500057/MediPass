module MedicalRecordsHelper

	def category_field_partial_path
    if params[:catagory].present?
      'medical_records/search_form/category_field'
    else
      'shared/empty_partial'
    end
  end
end
