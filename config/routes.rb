Rails.application.routes.draw do
  root to: "toppages#index"

  get 'toppages/index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  resources :users do
    member do
      get :likes
    end
  end
  resources :categories, only: %i[create]
  resources :posts do
    resource :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
end
