Rails.application.routes.draw do
  root 'tasks#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :categories, :except => [:show]
  resources :tasks, :except => [:show]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
