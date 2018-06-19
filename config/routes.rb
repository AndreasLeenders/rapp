Rails.application.routes.draw do
  resources :events
  resources :bands
  get '/search', to: 'events#search', as: 'search'

  resources :bands do
  resources :bookings
  end
  resources :organisers do
  resources :bookings, only: [:index, :show]
  end
  devise_for :users
  root to: 'pages#home'
end
