Rails.application.routes.draw do
  root 'static_pages#home'
  get '/get_started', to: 'static_pages#get_started'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/users/:id', to: 'users#profile'
end
