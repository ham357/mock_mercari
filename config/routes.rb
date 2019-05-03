Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products, only: [:index, :create, :new]
  get 'sell', to: 'products#new'
  resources :category, only: :index
  resources :product_shipping_methods, only: :index
  resources :mypages, only: :index
  resources :profiles, only: :index
  resources :cards, only: :index
  resources :card_creates, only: :index
  resources :identifacations, only: :index
  resources :signup_sns, only: :index
  devise_for :users, controllers:{
   registrations: 'users',
   omniauth_callbacks: "users/omniauth_callbacks"
   }
  resources :logouts, only: :index
  resources :products
  resources :searches
end
