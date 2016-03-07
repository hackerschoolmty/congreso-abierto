Rails.application.routes.draw do
  get 'legislatures/index'

  get 'legislatures/show'

  get 'legislatures/new'

  get 'legislatures/create'

  get 'legislatures/edit'

  get 'legislatures/update'

  get 'legislatures/destroy'

  resources :pages

  resources :representatives
  
  namespace :admin do
    resources :dashboard

    root 'dashboard#index'
  end

  devise_for :users

  root 'pages#index'
end
