Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  resources :books
  resources :users
  get 'homes/about'
  post 'users' => 'users#create'
  resources :users, only: [:show, :edit, :update, :create]
  patch 'users/:id' => 'user#update', as: 'update_user'
end

