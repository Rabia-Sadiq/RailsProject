Rails.application.routes.draw do
  get "chat_bot/show"
  get "chat_bot/create"
  get "home/index"
  devise_for :users, controllers: {
  registrations: 'users/registrations'
}
Rails.application.routes.draw do
  root 'home#index'
 get "undertone_quiz", to: "undertone_quiz#show"
end
 get 'about', to:'home#about'
 get 'ootd', to: 'products#ootd'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root to: 'home#index'

  get "up" => "rails/health#show", as: :rails_health_check

  
  post "undertone_quiz/answer", to: "undertone_quiz#answer"
  get 'users/favorites', to: 'users#favorites'
  get 'product', to: 'products#index'
  resources :favorite_colors, only: [:create, :index, :destroy]
  resources :favorite_dresses, only: [:create, :index, :destroy]
  delete '/favorite_dresses/:product_id', to: 'favorite_dresses#destroy', as: 'remove_favorite_dress'
  resources :products, only: [:index, :show]
  Rails.application.routes.draw do
  get 'chat_bot', to: 'chat_bot#show'
  post 'chat_bot', to: 'chat_bot#create', as: 'create_chat_bot'
  
  # Add your other routes here
end
    Rails.application.routes.draw do
  get "chat_bot/show"
  get "chat_bot/create"
  get "home/index"
 
      resources :undertone_quiz, only: [:show] do
        post :answer, on: :member
      end
      get 'palette', to: 'users#palette'
    end

  # Defines the root path route ("/")
  
end
