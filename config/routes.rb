Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products do
    resources :orders
  end
  get 'sell', to: 'products#new'
  resources :category, only: :index
  resources :product_shipping_methods, only: :index
  resources :brands, only: :index
  resources :mypages, only: :index
  resources :profiles, only: :index
  resources :cards, only: [:index,:new] do
    collection do
      post 'pay', to: 'cards#pay'
      delete 'delete', to: 'cards#delete'
    end
  end
  resources :identifacations, only: :index
  resources :signup_sns, only: :index
  devise_for :users, controllers:{
   registrations: 'users',
   omniauth_callbacks: "users/omniauth_callbacks"
   }
  resources :logouts, only: :index
  resources :searches
  resources :comments, only: :create
end
