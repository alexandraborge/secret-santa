Rails.application.routes.draw do
  root 'static_pages#home'
  get '/getting_started', to: 'static_pages#get_started'
end
