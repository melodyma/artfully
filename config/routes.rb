Rails.application.routes.draw do
 
  get 'oauth/instagram/connect', to: 'sessions#new'
  get 'oauth/instagram/callback', to: 'sessions#create'

  resources :artifacts
  resources :users, only: [:new, :create, :destroy]

  root :to => 'artifacts#index'

end
