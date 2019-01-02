Rails.application.routes.draw do
  resources :users
  resources :categories, :except => [:show]
  resources :tasks, :except => [:show]
  
  root 'tasks#index'
end
