Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "products#index"
  #get 'items', to: 'items#index'
  #post 'items/new', to: 'items#new'
  ##resources :items, only: [:index, :new, :create]
  resources :products, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :purchase, only: [:index, :create]
  end
  ##resources :products
  resources :users, only: :show
end
