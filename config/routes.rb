Rails.application.routes.draw do
 
 resources :artifacts
 resources :users, only: [:new, :create, :destroy]

end
