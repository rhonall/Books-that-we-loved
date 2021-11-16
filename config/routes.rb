Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'books#index'
  resources :books
  resources :authors
  resources :genres
  resources :owned_books
  resources :requests
  resources :fav_genres
  get '/users', to: 'users#index'
  get '/find', to: 'books#find'
  get '/found_results', to: 'books#found_results'
  get '/search', to: 'books#search'
  get '/request/:id', to: 'requests#action', as: 'action_request'
  get '/request/:id/accept', to: 'requests#accept', as: 'accept_request'
  get '/request/:id/decline', to: 'requests#decline', as: 'decline_request'
end

