Rails.application.routes.draw do
  resources :bookings
  resources :motorbikes
  devise_for :users
  root to: 'pages#home'
end
