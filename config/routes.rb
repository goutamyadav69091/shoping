Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'users/login' , to: 'authentication#login'
  get '/products/current_user', to: 'products#current_user_products'
  get 'orders/current_user', to: 'orders#current_user_orders'
  resources :users
  resources :products
  resources :carts
  resources :orders
end
