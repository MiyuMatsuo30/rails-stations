Rails.application.routes.draw do
  get 'movies/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # post "/admin/movies/new" => "admin/movies#create"
  get "/movies", to: "movies#index"
  namespace :admin do
  resources :movies
  end
  # get "/admin/movies", to: "admin/movies#index"
  # get "/admin/movies/new", to: "admin/movies#new"
  # post "/admin/movies", to: "admin/movies#create"
  # get "/admin/movies/:id", to: "admin/movies#show"
  # get "/admin/movies/:id/edit", to: "admin/movies#edit"
  # put "/admin/movies/:id", to: "admin/movies#update"

  # Defines the root path route ("/")
  # root "posts#index"
end
