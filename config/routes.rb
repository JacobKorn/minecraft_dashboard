Rails.application.routes.draw do
  get 'droplets/show'

  namespace :admin do
    resources :users
    root to: "users#index"
  end

  root to: 'visitors#index'

  devise_for :users
  resources :users
  resources :droplets, only: [:index, :show]
  post "droplets/register/:droplet_id",   to: "droplets#register", as: "register_droplet"
  put  "droplets/deregister/:droplet_id", to: "droplets#deregister", as: "deregister_droplet"
end
