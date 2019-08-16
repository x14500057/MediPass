Rails.application.routes.draw do

	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # (#) respresents a method
  # calls the pages controller
  # executes the index public method
  root to: 'pages#index' 
end
