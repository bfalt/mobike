Rails.application.routes.draw do
  get 'reviews/new'
  get 'reviews/create'
  get 'pages/dashboard'
  get 'pages/terms'

  resources :motorbikes do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:show] do
    resources :reviews, only: [:new, :create]
  end
  devise_for :users
  root to: 'pages#home'
end
