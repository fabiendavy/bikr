Rails.application.routes.draw do
  devise_for :users
  
  root to: 'bikes#index'

  resources :bikes do
    resources :bookings, only: [:create]
    collection do
      get :results
    end
  end

  resources :bookings, only: [:show, :edit, :destroy, :update, :index]
end
