Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #resources :gossips
  root to: "gossips#index"
  resources :gossips do
    resources :comment
    resources :likes
  end

  resources :users
  resources :cities
  resources :sessions
  get "/contact", to: "static#contact"
  get "/team", to: "static#team"
end
