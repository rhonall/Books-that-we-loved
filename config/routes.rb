Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'books#index'
  resources :books
  resources :authors
  resources :genres
  resources :owned_books
  resources :requests
  get '/users', to: 'users#index'
  get '/fav_genres', to: 'users#fav'
  get '/add_fav_genres', to: 'users#add_fav_genres'
  get '/find', to: 'books#find'
  get '/found_results', to: 'books#found_results'
  get '/search', to: 'books#search'
  get '/request/:id', to: 'requests#action', as: 'action_request'
end

