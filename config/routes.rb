Rails.application.routes.draw do
  resources :users
  resources :questions

  root 'questions#index'
  
  get  '/signup',  to: 'users#new'



end
