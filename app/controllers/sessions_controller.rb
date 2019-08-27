class SessionsController < Devise::SessionsController
	#after_sign_in_path_for is called by devise
	def after_sign_in_path_for(user)


	def create
		@user = User.where(email: params[:email]).first
		if @user.confirmed? and @user.authenticate(params[:password])
			session[:user_id] = @user.user_id
			redirect_to root_path
		else
			flash[:error] = "Invalid email or password"
			render new
		end
	end

	def


	if user.doctor? 
			
			"/signedinuserdoctor" 
		elsif user.patient?
			
			"/signedinuserpatient"
		else
			root_path
		end
	end
end