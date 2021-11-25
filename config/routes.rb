Rails.application.routes.draw do
  devise_for :users
  get '/', to: 'books#index'
  resources :books
  resources :authors#, except/only
  resources :genres
  resources :owned_books
  resources :requests
  resources :fav_genres
  get '/users', to: 'users#index'
  get '/admins', to: 'admins#index'
  get '/find', to: 'books#find'
  get '/found_results', to: 'books#found_results'
  get '/search', to: 'books#search'
  # get '/requests/:id/action', to: 'requests#action', as: 'action_request'
  get '/request/:id/accept', to: 'requests#accept', as: 'accept_request'
  get '/request/:id/decline', to: 'requests#decline', as: 'decline_request'
end

