Rails.application.routes.draw do

  #, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get 'condos/index'
  devise_for :users

  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "verify_username", to: "users#verify_username"
  # Defines the root path route ("/")
  resources :notes, only: :index
  resources :documents
  # root "articles#index"
end
