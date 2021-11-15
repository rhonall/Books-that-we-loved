Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  get '/', to: 'books#index'
  resources :books
  resources :authors
  resources :genres
  resources :owned_books
  resources :requests
  get '/find', to: 'books#find'
  get '/found_results', to: 'books#found_results'
  get '/search', to: 'books#search'
  get '/request/:id', to: 'requests#action', as: 'action_request'
  get '/fav_genres', to: 'genres#fav', as: 'fav_genres'
end

