Rails.application.routes.draw do
  root "home#index"

  # get '/test', controller: 'home', action: 'test'
  # get '/test' => 'home#test', as: 'nesto'
  get '/test' => 'home#test'
  # get '/products' => 'home#products'

  resources :products
  # resources :products, only: [:index, :edit, :show]
  # resources :products, except: [:index]
end
