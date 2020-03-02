Rails.application.routes.draw do
  resources :users
  resources :motorbikes
  # get 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/show'
  # get 'users/update'
  # get 'users/destroy'
  # get 'motorbikes/index'
  # get 'motorbikes/new'
  # get 'motorbikes/create'
  # get 'motorbikes/show'
  # get 'motorbikes/edit'
  # get 'motorbikes/update'
  # get 'motorbikes/destroy'
  devise_for :users
  root to: 'pages#home'
end
