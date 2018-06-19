Rails.application.routes.draw do
  resources :events
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
