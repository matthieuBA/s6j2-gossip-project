Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :gossips
  root to: "gossips#index"
  resources :gossips do
    resources :comment
  end
  resources :users
  resources :cities
  resources :sessions
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "welcome", to: "sessions#welcome"
  get "authorized", to: "sessions#page_requires_login"
end
