Rails.application.routes.draw do
  resources :pages  
  resources :representatives
  resources :legislatures
  
  namespace :admin do
    resources :dashboard
    resources :observers
    resources :legislatures
    root 'dashboard#index'
  end

  devise_for :users

  root 'pages#index'
end
