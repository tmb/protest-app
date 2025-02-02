Rails.application.routes.draw do
  resources :protests do
    post 'rsvp'
    get 'admin'
    post 'admin/notify', to: 'protests#notify'
  end

  get 'upload_image/:key', to: 'protests#image_upload', as: 'protests_image_upload'
  post 'upload_image/:key', to: 'protests#upload', as: 'protests_upload'

  root to: 'protests#index'
end
