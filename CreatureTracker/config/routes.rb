Rails.application.routes.draw do
  resources :creatures, only: [:index, :show, :create, :update, :destroy] do
    resources :notes, only: [:show, :create, :update, :destroy]
  end

end