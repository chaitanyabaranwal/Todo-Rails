Rails.application.routes.draw do
  resources :categories, :except => [:show]
  resources :tasks, :except => [:show]
  
  root 'tasks#index'
end
