Rails.application.routes.draw do
  resources :bookings, only: :index
  get '/search', to: 'events#search', as: 'search'

  resources :events
  get '/my_events', to: 'events#show_user_events', as: 'my_events'
  get '/my_profile', to: 'profile#show_organiser_profile', as: 'my_profile'


  resources :bands

  resources :bands do
  resources :bookings
  end

  resources :organisers do
  resources :bookings, only: [:index, :show]
  end

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
end
