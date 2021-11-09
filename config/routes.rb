Rails.application.routes.draw do
  get '/', to: 'books#index'
  resources :books
  resources :authors
  resources :genres
  get '/search', to: 'books#search'
  get '/search_results', to: 'books#search_results'
  get '/find', to: 'books#find'
end

