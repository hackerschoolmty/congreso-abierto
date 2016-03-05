Rails.application.routes.draw do
  namespace :admin do
    resources :dashboard

    root 'dashboard#index'
  end

  devise_for :users
end
