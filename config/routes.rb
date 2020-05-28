Rails.application.routes.draw do
  # get 'home/index'
  # root 'home#index'
  resources :users

  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/account' => 'account#home'

  get '/choose/competitors' => 'competitors#display'
  post '/choose/competitors' => 'competitors#filter'

  resources :sports
  resources :events
  resources :bets
  resources :competitors, only: [:show]

end
