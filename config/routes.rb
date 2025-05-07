Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  get "up" => "rails/health#show", as: :rails_health_check
  get "/sign_up", to: "registrations#new"
  post "/sign_up", to: "registrations#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create", as: :manual_login
  get "undertone_quiz", to: "undertone_quiz#show"
  post "undertone_quiz/answer", to: "undertone_quiz#answer"
  resource :registration, only: [ :new, :create ]
  resource :session
  resources :password_resets, only: [ :new, :create, :edit, :update ]
    resource :password


  # Defines the root path route ("/")
  root "main#index"
end
