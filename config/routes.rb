Rails.application.routes.draw do
  devise_for :users
  
  resources :shipments do
    collection do
      get :search
    end
  end
  root to: 'shipments#index'
end


