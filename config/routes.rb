Rails.application.routes.draw do
  resources :pages  
  resources :representatives
  resources :legislatures
  
  resources :legislatures_representatives

  namespace :admin do
    resources :dashboard
    resources :observers do 
      put 'activate' => 'observers#activate', on: :member
      put 'deactivate' => 'observers#deactivate', on: :member
    end 
    resources :legislatures
    root 'dashboard#index'
  end

  devise_for :users

  root 'pages#index'
end
