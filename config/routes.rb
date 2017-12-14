Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  resources :microposts,          only: [:create, :destroy]

  root 'questions#index'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end