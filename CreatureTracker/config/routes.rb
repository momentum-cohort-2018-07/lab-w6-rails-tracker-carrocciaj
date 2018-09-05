Rails.application.routes.draw do
  resources :creatures, only: [:index, :show, :create, :update, :destroy]
end