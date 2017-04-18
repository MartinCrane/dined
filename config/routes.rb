Rails.application.routes.draw do
  resources :restaurants
  resources :accounts, only: [:create]
  resources :cocktails, only: [:index, :show]
  resources :sessions, only: [:create]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'
  post 'authenticate', to: 'auth#authenticate'
  get '/zip_view/:id', to: 'restaurants#zip_view'

  root 'static#home'
end
