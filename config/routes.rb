Rails.application.routes.draw do
  root 'books#index'

  get 'signup', to: 'users#new', as: 'signup'
  post 'signup', to: 'users#create'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:show]

  resources :books, only: [:index, :show]

  resources :borrowings, only: [:create, :update]
end