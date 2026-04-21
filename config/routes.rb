Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'movies/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  get '/movies/:movie_id/reservation', to: 'movies#reservation'
  # post "/movies/:movie_id/reservation", to: "movies#reservation"
  # post "/movies/:movie_id", to: "movies#show"
  # get "/movies/:movie_id/schedules/:schedule_id/sheets", to: "admin/schedules#index"
  namespace :admin do
    resources :movies do
      resources :schedules
    end
  end
  namespace :admin do
    resources :reservations
  end
  resources :movies do
    resources :schedules do
      resources :reservations
    end
  end
  resources :sheets
  resources :schedules
  resources :reservations

  # Defines the root path route ("/")
  # root "posts#index"
end
