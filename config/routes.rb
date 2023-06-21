Rails.application.routes.draw do
  devise_for :users

  root 'posts#index'

  resources :users, only: %i[show edit update]

  resources :posts do
    resources :comments
  end
end
