Rails.application.routes.draw do
  
  # get 'home/index'
  # root 'home#index'
  resources :users

  get '/' => 'welcomes#index'
  get '/welcome' => 'welcomes#index'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/account' => 'account#home', as: 'home'

  get '/choose/competitors' => 'competitors#display'
  post '/choose/competitors' => 'competitors#filter'

  get '/choose/events' => 'events#display'
  post '/choose/events' => 'events#filter'
  
  get '/choose/sports' => 'sports#display'
  get '/choose/sports' => 'sports#display'
  
  get '/choose/markets' => 'markets#display'
  post '/choose/markets' => 'markets#filter'

  

  post '/watchlist/add' => 'account#add_watch_list', as: 'track_new'
  get '/watchlist/remove' => 'account#remove_watch_list', as: 'remove_track'

  resources :sports
  resources :events, only: [:show]
  resources :competitors, only: [:show]

end
