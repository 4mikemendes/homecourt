Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tennis_courts do
    resources :bookings
      resources :schedules, only: [:new, :edit, :create, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
