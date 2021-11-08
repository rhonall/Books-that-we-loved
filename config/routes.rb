Rails.application.routes.draw do
  get '/', to: 'books#index'
  resources :books
  get '/search', to: 'books#search'
  get '/search_results', to: 'books#search_results'
end

