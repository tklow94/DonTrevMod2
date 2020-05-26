Rails.application.routes.draw do
  resources :users
  resources :sports
  resources :leagues
  resources :competitors
  resources :events
  resources :bets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
