  require 'sidekiq/web'

Rails.application.routes.draw do

  get "/users/database_contents", to: "users#database_contents"
  root "users#index"

# or require 'sidekiq/pro/web'
# or require 'sidekiq-ent/web'

  mount Sidekiq::Web => "/sidekiq" # mount Sidekiq::Web in your Rails app
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
