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

resource :profile, only: [:show, :update, :edit]

 get 'about', to:'home#about'
 get 'ootd', to: 'products#ootd'
  
  get "up" => "rails/health#show", as: :rails_health_check

get 'q1', to: 'undertone_quiz#q1'
get 'q2', to: 'undertone_quiz#q2'
get 'q3', to: 'undertone_quiz#q3'
get 'q4', to: 'undertone_quiz#q4'
get 'q5', to: 'undertone_quiz#q5'
get 'q6', to: 'undertone_quiz#q6'
get 'q7', to: 'undertone_quiz#q7'

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
  
 
patch '/users/profile', to: 'profiles#update'
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

  
  
end
