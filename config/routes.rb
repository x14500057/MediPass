Rails.application.routes.draw do

  resources :allergies
  resources :prescriptions
  resources :doctors
  resources :medical_records 
# end
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # (#) respresents a method
  # calls the pages controller
  # executes the index public method

  root to: 'pages#index'

  resources :patients do
    resources :allergies
  end
  

  resources :patients do
  	resources :medical_records do   
    end
  end
  
    resources :medical_records do 
        resources :prescriptions
    end
  
  resources :patients
	devise_for :users

	devise_scope :user do
     get "signup", to: "devise/registrations#new"
     get "login", to: "devise/sessions#new"
     get "logout", to: "devise/sessions#destroy"
	end

	get '/signedinuserpatient' => 'patients#signedinuserpatient'
	get '/signedinuserdoctor' => 'doctors#signedinuserdoctor'
  
end
