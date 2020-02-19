Rails.application.routes.draw do
  devise_for :users
  
  root to: 'bikes#index'

  resources :bikes do 
    collection do
      get :results
    end
  end
  resources :users do
    resources :bookings, only: [:index, :create]
  end
  resources :bookings, only: [:show, :edit, :destroy, :update]
end
