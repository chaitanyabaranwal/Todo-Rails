Rails.application.routes.draw do
  resources :categories
  resources :tasks
  
  root 'tasks#index'
end
