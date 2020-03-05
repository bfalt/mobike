Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'pages/dashboard'

  resources :motorbikes do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:show]
  devise_for :users
  root to: 'pages#home'
end
