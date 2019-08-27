Rails.application.routes.draw do

  resources :prescriptions
  resources :doctors
  resources :medical_records 
# end
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # (#) respresents a method
  # calls the pages controller
  # executes the index public method
  root to: 'devise/sessions#new' 


  resources :patients do
  	resources :medical_records 
     
  end

  resources :medical_records do 
      resources :prescriptions
    end
  
  resources :patients
	devise_for :users

	devise_scope :user do
	  root to: 'devise/sessions#new'
	end

	devise_scope :user do
	  get 'signup', to: 'devise/registrations#new'
	end

	get '/signedinuserpatient' => 'patients#signedinuserpatient'
	get '/signedinuserdoctor' => 'doctors#signedinuserdoctor'
end
