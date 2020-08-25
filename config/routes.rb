Rails.application.routes.draw do
  resources :franchises, only: %i[index show new create edit update]
  resources :badges_games, only: %i[new create]
  resources :weeks, only: [:index]
  resources :years, only: [:index]
  resources :badge_years, only: [:index]
  resources :badges, only: %i[index show new create edit update]
  resources :games, only: %i[index show new create edit update]
  resources :esrb_ratings, only: %i[index new create]
  resources :genres, only: %i[index show new create edit update]
  resources :platforms, only: %i[index show new create edit update]
  resources :publishers, only: %i[index show new create edit update]
  get '/search', to: 'application#search', as: 'search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
end
