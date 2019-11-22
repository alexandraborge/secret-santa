Rails.application.routes.draw do
  root 'static_pages#home'
  get '/get_started', to: 'static_pages#get_started'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  get '/users/:id/settings', to: 'users#settings'
  get '/create_secret_santa_game', to: 'secret_santa_games#new'
  post '/create_secret_santa_game', to: 'secret_santa_games#create'
  get '/create_greedy_grab_bag_game', to: 'greedy_grab_bag_games#new'
  post '/create_greedy_grab_bag_game', to: 'greedy_grab_bag_games#create'
  resources :secret_santa_games
  resources :greedy_grab_bag_games
end
