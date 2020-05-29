Rails.application.routes.draw do
  
  resources :users

  get '/' => 'welcomes#index'
  get '/welcome' => 'welcomes#index'
  
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  
  get '/account' => 'account#home', as: 'home'
  get '/account/matches', as: 'matches'
  get '/account/sports', as: 'sports'
  get '/account/teams', as: 'teams'
  get '/account/wagers', as: 'wagers'


  get '/choose/competitors' => 'competitors#display'
  post '/choose/competitors' => 'competitors#filter'

  get '/choose/events' => 'events#display'
  post '/choose/events' => 'events#filter'
  
  get '/choose/sports' => 'sports#display'
  post '/choose/sports' => 'sports#display'

  post '/watchlist/add' => 'account#add_watch_list', as: 'track_new'
  get '/watchlist/remove' => 'account#remove_watch_list', as: 'remove_track'

  post '/account/wipe_assoc' => 'account#wipe_assoc', as: 'wipe_assoc'
  get '/account/data' => 'account#data_maintenance', as: 'data_main'

  resources :sports
  resources :events, only: [:show]
  resources :competitors, only: [:show]

end
