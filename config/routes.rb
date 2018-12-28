Rails.application.routes.draw do
  devise_for :users
  resources :categories, :except => [:show]
  resources :tasks, :except => [:show]
  
  root 'tasks#index'
end
