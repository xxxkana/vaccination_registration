Rails.application.routes.draw do
  devise_for :users
  root to: 'registers#new'
  resources :users, only: [:edit, :update]
  resources :registers, only: [:new, :create] 
end
