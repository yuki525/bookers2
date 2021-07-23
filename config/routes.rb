Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'
  get "/home/about" => 'homes#show'

  resources :users


  resources :books


end
