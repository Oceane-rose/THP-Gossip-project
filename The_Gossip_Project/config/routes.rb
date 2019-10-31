Rails.application.routes.draw do

  get '/cities/show',  to: 'static_pages#show_cities', as: 'show_cities'
  get '/welcome', to: 'dynamic_pages#welcome', as: 'welcome'
  get '/show/:id', to: 'dynamic_pages#show', as: 'welcome_logged'
  get '/welcome', to: 'dynamic_pages#welcome', as: 'home'

  get '/contact', to: 'static_pages#contact'
  
  get '/team', to: 'static_pages#team'


resources :gossips, only: [:new, :create, :show, :update, :edit, :destroy]

resources :users, only: [:show]
resources :currentusers, only: [:new, :create, :show, :update, :edit, :destroy]

resources :cities, only: [:show]


end
