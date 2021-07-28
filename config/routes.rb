Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'
  get "/home/about" => 'homes#show'

  resources :users

  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end
