Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tennis_courts do
  resources :reviews, only: [:new, :create]

  resources :bookings, only: [:create]
  resources :schedules, only: [:new, :edit, :create, :update]
  end
  resources :bookings, only: [:update]
  resources :reviews, only: :destroy
  get 'dashboard', to: 'pages#dashboard'
  resources :orders, only: [:show, :create] do
  resources :payments, only: :new
  end
  mount StripeEvent::Engine, at: '/stripe-webhooks'
end
