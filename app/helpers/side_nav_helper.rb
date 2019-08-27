module SideNavHelper

	def side_nav_links_partial_path
		if user_doctor?
	      'layouts/side_navigation/login_doctor_required_links'
	    elsif user_patient?
	      'layouts/side_navigation/login_patient_required_links'
	    else
	      'layouts/side_navigation/not_signed_in_side_navigation'
	    end
 	end
 	
end