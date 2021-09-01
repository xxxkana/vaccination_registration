Rails.application.routes.draw do
  devise_for :users
  root to: 'registers#index'
  resources :users, only: [:edit, :update] do
    resources :users, only: [:edit, :update]
  end

end
