Rails.application.routes.draw do
  root "home#index"

  get '/test' => 'home#test'

  namespace :admin do
    resource :dashboard, only: [:show]
    resources :products
  end

  resources :categories
  resources :sellers
  resources :orders
  resources :users, only: [:new, :create]
  resource :about, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :products
end
