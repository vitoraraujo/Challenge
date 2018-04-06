Rails.application.routes.draw do

  get    'sessions/new'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :challenges
  resources :users
  resources :relationships,       only: [:create, :destroy]
  
  root 'users#index'
end
