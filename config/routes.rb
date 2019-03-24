Rails.application.routes.draw do
  root to: 'protests#index'
  resources :protests
end
