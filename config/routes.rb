Rails.application.routes.draw do
  resources :protests do
    post 'rsvp'
    get 'admin'
    post 'admin/notify', to: 'protests#notify'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'protests#index'

end
