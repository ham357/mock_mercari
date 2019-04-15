Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'homes#index'
  resources :mypages, only: :index
  resources :profiles, only: :index
  #profilesはmypagesのネスト
  resources :identifacations, only: :index
  #identificationはmypagesのネスト
end
