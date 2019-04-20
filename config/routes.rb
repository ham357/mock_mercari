Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :category, only: :index
  resources :mypages, only: :index
  resources :profiles, only: :index
  #profilesはmypagesのネスト
  resources :cards, only: :index
  #cardsはmypagesのネスト
  resources :card_creates, only: :index
  resources :identifacations, only: :index
  #identificationはmypagesのネスト
end
