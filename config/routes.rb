Rails.application.routes.draw do
  devise_for :users
  resources :articles do
  	resources :comments, only: [:create]
  end
  resources :users, only: [:show]
  root 'articles#index'
end
