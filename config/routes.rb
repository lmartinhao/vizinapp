Rails.application.routes.draw do
  get 'condos/index'
  devise_for :users#, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  post "verify_username", to: "users#verify_username"
  # Defines the root path route ("/")
  # root "articles#index"
end
