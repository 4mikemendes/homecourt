Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tennis_courts do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:update]
end
