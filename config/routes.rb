Rails.application.routes.draw do
  root "home#index"

  get '/test' => 'home#test'

  resources :categories
  resources :sellers
  resources :users, only: [:new, :create]
  resource :about, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :products
end
