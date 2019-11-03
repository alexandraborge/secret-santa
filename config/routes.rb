Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  get '/get_started', to: 'static_pages#get_started'
end
