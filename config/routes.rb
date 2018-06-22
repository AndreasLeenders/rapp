Rails.application.routes.draw do
  resources :bookings, only: :index
  resources :ratings, only: [:new, :create, :destroy]
  get '/search', to: 'events#search', as: 'search'
  get '/bands/:id/ratings', to: 'ratings#new'

  resources :events do
    resources :bookings, only: [:new, :create]
  end

  get '/my_events', to: 'events#show_user_events', as: 'my_events'
  get '/my_profile', to: 'profile#show_organiser_profile', as: 'my_profile'



  resources :bands
  resources :bookings

  get "/my_bookings", to: "bookings#index", as: "my_bookings"

  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
end
