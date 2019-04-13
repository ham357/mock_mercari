Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :mypages, only: :index
  resources :profile, only: :index
  #profileはmypagesのネスト

  root to: 'products#index'

end
