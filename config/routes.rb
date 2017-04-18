Rails.application.routes.draw do
  
  resources :restaurants
  resources :accounts, only: [:create]
  resources :cocktails, only: [:index, :show]
  resources :sessions, only: [:create]

  get '/zip_view/:id', to: 'restaurants#zip_view'
  get '/price_view/:id', to: 'restaurants#price_view'
  get '/rating_view/:id', to: 'restaurants#rating_view'

  root 'static#home'
end
