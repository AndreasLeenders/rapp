Rails.application.routes.draw do
  resources :bookings, only: :index
  get '/search', to: 'events#search', as: 'search'
  # get '/bands/:id/ratings', to: 'ratings#new'

  resources :events do
    resources :bookings, only: [:new, :create]
  end

  get '/my_events', to: 'events#show_user_events', as: 'my_events'


  resources :organisers
  resources :bands

  resources :bookings do
    resources :ratings, only: [:new, :create ]
  end

  get "/my_bookings", to: "bookings#index", as: "my_bookings"

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
end
