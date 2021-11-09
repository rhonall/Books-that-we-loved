Rails.application.routes.draw do
  get '/', to: 'books#index'
  resources :books
  resources :authors
  resources :genres
  get '/find', to: 'books#find'
  get '/found_results', to: 'books#found_results'
  get '/search', to: 'books#search'
end

