Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#create"
  # get 'users/create', to: "users#create"
  post 'users/login' , to: 'authentication#login'
  get '/products/current_user', to: 'products#current_user_products'
  get 'orders/current_user', to: 'orders#current_user_orders'
  # resources :users
  resources :users do
    get '/page/:page', action: :index, on: :collection
  end
  resources :products do
  	get '/page/:page', action: :index, on: :collection
  end
  resources :carts
  resources :orders
end
