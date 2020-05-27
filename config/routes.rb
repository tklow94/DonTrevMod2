Rails.application.routes.draw do
  # get 'home/index'
  # root 'home#index'
  resources :users

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :sports
  resources :leagues
  resources :competitors
  resources :events
  resources :bets

end
