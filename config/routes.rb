Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :tasks
  
  root 'tasks#index'
end
