Rails.application.routes.draw do

  get    '/feed',    to: 'challenges#feed'
  get    'sessions/new'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get    '/logout',  to: 'sessions#destroy'
  delete '/logout',  to: 'sessions#destroy'

  post   'challenges/search' => 'challenges#search' 
  post   'users/search'      => 'users#search' 

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :challenges do
    resources :comments, only: [:create, :destroy]
    resources :dones, only: [:create, :destroy]
    
  end

  resources :challenges do
    member do
      put 'like'   => "challenges#like"
      put 'unvote' => "challenges#unvote"
    end
  end

  resources :dones do
    member do
      put 'like'   => "dones#like"
      put 'unvote' => "dones#unvote"
    end
  end

  resources :dones
  resources :challenges
  resources :users
  resources :comments
  resources :relationships, only: [:create, :destroy]
  
  root 'challenges#feed'
end
