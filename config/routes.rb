Rails.application.routes.draw do
  resources :categories
  resources :sellers
  resources :users, only: [:new, :create]
  root "home#index"

  # get '/test', controller: 'home', action: 'test'
  # get '/test' => 'home#test', as: 'nesto'
  get '/test' => 'home#test'
  # get '/about' => 'static_pages#about'
  # get '/products' => 'home#products'

  resource :about, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :products
  # resources :products, only: [:index, :edit, :show]
  # resources :products, except: [:index]
end
