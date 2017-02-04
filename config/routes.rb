Rails.application.routes.draw do
  get 'droplets/show'

  namespace :admin do
    resources :users
    root to: "users#index"
  end

  root to: 'visitors#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
  resources :droplets, only: [:index, :show]
  post "droplets/register/:droplet_id",   to: "droplets#register",   as: "register_droplet"
  put  "droplets/deregister/:droplet_id", to: "droplets#deregister", as: "deregister_droplet"
  put  "droplets/power_down/:droplet_id", to: "droplets#power_down", as: "power_down_droplet"
  put  "droplets/power_up/:droplet_id",   to: "droplets#power_up",   as: "power_up_droplet"
end
