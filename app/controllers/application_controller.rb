class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	before_action :configure_permitted_parameters, if: :devise_controller?

	helper_method :user_doctor?
    def user_doctor?
      user_signed_in? && current_user.role == "doctor"
    end

    helper_method :user_patient?
    def user_patient?
      user_signed_in? && current_user.role == "patient"
    end

	protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role])

    end

	def after_sign_in_path_for(resource)

		if resource.doctor? 
			puts("\n\n\nWelcome To Doctor signup")
			"/signedinuserdoctor" 
		elsif resource.patient?
			puts("\n\n\nWelcome To Patient signup")
			"/signedinuserpatient"
		else
			root_path
		end
	end
end