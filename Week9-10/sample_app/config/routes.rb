Rails.application.routes.draw do
  resources :todos

  get '/get', to: 'sample#get'
end