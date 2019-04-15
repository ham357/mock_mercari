Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :mypages, only: :index
  resources :profiles, only: :index
  #profilesはmypagesのネスト
  resources :cards, only: :index
  #cardsはmypagesのネスト
  resources :card_creates, only: :index
  resources :identifacations, only: :index
  #identificationはmypagesのネスト

  root to: 'products#index'

end
