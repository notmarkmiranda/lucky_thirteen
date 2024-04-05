Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", :as => :rails_health_check

  # Defines the root path route ("/")
  root "pages#index"

  get "/dashboard", to: "users#show", as: "dashboard"

  resources :leagues, only: [:new, :create, :show]
end
