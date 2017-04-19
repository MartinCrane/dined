Rails.application.routes.draw do

  resources :restaurants
  resources :accounts, only: [:create]
  resources :cocktails, only: [:index, :show]
  resources :sessions, only: [:create]

  post '/zip_view/:id', to: 'restaurants#zip_view'
  post '/price_view/:id', to: 'restaurants#price_view'
  post '/rating_view/:id', to: 'restaurants#rating_view'
  post '/restoreAccount', to: 'accounts#restoreAccount'
  post '/add_favorites', to: 'favorites#add_favorites'
  post '/retrieve_favorites', to: 'favorites#retrieve_favorites'

  root 'static#home'
end
