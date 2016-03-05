Rails.application.routes.draw do
  resources :pages

  namespace :admin do
    resources :dashboard

    root 'dashboard#index'
  end

  devise_for :users

  root 'pages#index'
end
