Rails.application.routes.draw do
  resources :bugs
  # # devise_for :users
  #  get 'users/index'
  # get 'users/new'
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   passwords: 'users/passwords',
  #   registrations: 'users/registrations'



  # }
  get 'users/index'
  match '/users',   to: 'users#index',   via: 'get'
  devise_for :users
  resources :users
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
