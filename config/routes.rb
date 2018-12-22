Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create] do
    member do
      get :likes
    end
  end
  
  resources :areas, only: [:create, :destroy]
  
  resources :prefectures, only: [:create, :destroy]
  post 'prefectures/sort', as: 'sort_prefectures'
  resources :events, only: [:new, :create, :destroy]
  resources :likes, only: [:create, :destroy]
  get 'rankings/like', to: 'rankings#like'
end
