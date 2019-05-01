Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products, only: [:index, :create, :new]
  get 'sell', to: 'products#new'
  resources :category, only: :index
  resources :product_shipping_methods, only: :index
  resources :mypages, only: :index
=======
  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  resources :category, only: :inde

>>>>>>> ONAGAX/master
  resources :profiles, only: :index
  resources :cards, only: :index
  resources :card_creates, only: :index
  resources :identifacations, only: :index
  resources :signup_sns, only: :index
  devise_for :users, controllers:{
   registrations: 'users',
   omniauth_callbacks: "users/omniauth_callbacks"
   }
  resources :users
  resources :mypages, only: :index
  resources :logouts, only: :index
  resources :products

end
