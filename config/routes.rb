Rails.application.routes.draw do
  root "users#index"

  resources :users
  resources :tools
  resources :categories
end
