Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  get "up" => "rails/health#show", as: :rails_health_check

  resourse: registration
  resourse:session
  resourse:password_reset
  resourse:password
  
  # Defines the root path route ("/")
  # root "posts#index"
end
