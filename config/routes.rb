Rails.application.routes.draw do
  resources :shipments
  root to: 'shipments#index'
end
