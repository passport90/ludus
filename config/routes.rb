Rails.application.routes.draw do
  resources :genres, only: [:index, :new, :create]
  resources :platforms, only: [:index, :show, :new, :create]
  resources :publishers, only: [:index, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
end
