Rails.application.routes.draw do
  resources :restaurants
  resources :accounts, only: [:new, :create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/zip_view/:id', to: 'restaurants#zip_view'
  get '/price_view/:id', to: 'restaurants#price_view'
  get '/rating_view/:id', to: 'restaurants#rating_view'

  root 'static#home'
end
