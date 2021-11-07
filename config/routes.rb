Rails.application.routes.draw do
  root to: "toppages#index"

  get 'toppages/index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  resources :users
  resources :categories, only: %i[create]
  resources :posts do
    resources :comments, only: %i[create destroy]
  end
end
