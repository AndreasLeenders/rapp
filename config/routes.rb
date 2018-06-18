Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
