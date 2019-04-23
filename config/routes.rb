Rails.application.routes.draw do
  root 'homes#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  resources :category, only: :inde

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
  resources :searches, only: :index

end
