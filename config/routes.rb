Rails.application.routes.draw do
  resources :badges_games, only: [:new, :create]
  resources :weeks, only: [:index]
  resources :years, only: [:index]
  resources :badges, only: [:index, :show, :new, :create]
  resources :games, only: [:index, :show, :new, :create]
  resources :esrb_ratings, only: [:index, :new, :create]
  resources :genres, only: [:index, :show, :new, :create]
  resources :platforms, only: [:index, :show, :new, :create]
  resources :publishers, only: [:index, :show, :new, :create]
  get '/search', to: 'application#search', as: 'search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
end
