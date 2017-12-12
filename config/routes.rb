Rails.application.routes.draw do
  resources :users 
  resources :questions do 
    resources :comments
  end

  root 'questions#index', as: 'home'


end
