Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  
  get "up" => "rails/health#show", as: :rails_health_check
  get "/sign_up", to: "registrations#new"
  post "/sign_up", to: "registrations#create"
  resource :registration, only: [:new, :create]
  resource :session
  resource :password_reset
  resource :password

  
  # Defines the root path route ("/")
  root "main#index"
end
