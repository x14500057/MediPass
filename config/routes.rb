Rails.application.routes.draw do

  resources :doctors
  resources :medical_records 
# end
  #For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # (#) respresents a method
  # calls the pages controller
  # executes the index public method
  root to: 'pages#index' 

  resources :patients
	devise_for :users

	devise_scope :user do
	  get 'login', to: 'devise/sessions#new'
	end

	devise_scope :user do
	  get 'signup', to: 'devise/registrations#new'
	end

	get '/signedinuserpatient' => 'patients#signedinuserpatient'
	get '/signedinuserdoctor' => 'doctors#signedinuserdoctor'
end
