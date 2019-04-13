Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :mypages, only: :index
  resources :profiles, only: :index
  #profilesはmypagesのネスト

  root to: 'products#index'

end
