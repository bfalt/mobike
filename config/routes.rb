Rails.application.routes.draw do
  resources :motorbikes
  devise_for :users
  root to: 'pages#home'
end
