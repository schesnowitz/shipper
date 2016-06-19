Rails.application.routes.draw do
  devise_for :users
  resources :shipments
  root to: 'shipments#index'
end
