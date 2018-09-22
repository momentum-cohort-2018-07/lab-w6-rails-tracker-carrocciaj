Rails.application.routes.draw do
  namespace :api do
  resources :creatures, only: [:index, :show, :create, :update, :destroy] do
    resources :notes, only: [:index, :show, :create, :update, :destroy]
  end
end
end