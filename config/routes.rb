Rails.application.routes.draw do

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  root to: "posts#index"

  get 'signup', to: 'users#new'

  resources :users
  resources :categories
  resources :posts do
    resources :comments
  end
end
