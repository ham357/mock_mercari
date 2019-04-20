Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm
  resources :category, only: :inde
  resources :mypages, only: :index
  resources :profiles, only: :index
  resources :cards, only: :index
  resources :card_creates, only: :index
  resources :identifacations, only: :index
  resources :user_infos
  resources :signup_sns, only: :index
end
