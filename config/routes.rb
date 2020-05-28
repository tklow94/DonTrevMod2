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

  resources :sports
  resources :competitors
  resources :events
  resources :bets

end
