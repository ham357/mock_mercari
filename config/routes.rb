Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'
  resources :users do
    resources :mypages, only: :index
    resources :profiles, only: :index
    resources :cards, only: :index
    resources :card_creates, only: :index
    resources :identifacations, only: :index
  end
  #identificationはmypagesのネスト

end
