Rails.application.routes.draw do
  get '/search', to: 'events#search', as: 'search'

  resources :events
  get '/my_events', to: 'events#show_user_events', as: 'my_events'


  resources :bands

  resources :bands do
  resources :bookings
  end
  resources :organisers do
  resources :bookings, only: [:index, :show]
  end
  devise_for :users
  root to: 'pages#home'
end
