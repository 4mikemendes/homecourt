Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tennis_courts do
    resources :reviews, only: [:new, :create]
    resources :schedules, only: [:new, :edit, :create, :update]
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:update] do
    resources :chatrooms, only: [:create]
  end

  resources :chatrooms, only: [:show] do
    resources :messages, only: :create
  end

  resources :reviews, only: :destroy
  get 'dashboard', to: 'pages#dashboard'
end
