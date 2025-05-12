Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  get "up" => "rails/health#show", as: :rails_health_check
  get "/sign_up", to: "registrations#new"
  post "/sign_up", to: "registrations#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create", as: :manual_login
  get "undertone_quiz", to: "undertone_quiz#show"
  post "undertone_quiz/answer", to: "undertone_quiz#answer"
  get 'users/favorites', to: 'users#favorites'
  resources :favorite_colors, only: [:create, :index, :destroy]
  resources :products, only: [:index, :show]
  resource :registration, only: [ :new, :create ]
  resource :session
  resources :password_resets, only: [ :new, :create, :edit, :update ]
    resource :password
    Rails.application.routes.draw do
      resources :undertone_quiz, only: [:show] do
        post :answer, on: :member
      end
      get 'palette', to: 'users#palette'
    end

  # Defines the root path route ("/")
  root "main#index"
end
