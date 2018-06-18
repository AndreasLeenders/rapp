Rails.application.routes.draw do
  resources :events, only: [:index, :show]
  resources :bands

  resources :organisers do
  resources :events, only: [:create, :edit, :update, :destroy]
  end
  resources :bands do
  resources :bookings
  end
  resources :organisers do
  resources :bookings, only: [:index, :show]
  end
  devise_for :users
  root to: 'pages#home'
end
