Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get '/get_started', to: 'static_pages#get_started'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
end
