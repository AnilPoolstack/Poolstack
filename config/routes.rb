Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get "up" => "rails/health#show", as: :rails_health_check

  resources :comments
  resources :blogs
  resources :abouts

  resources :home_pages, only: [:show, :index]
  resources :services
  resources :contacts, only: [:create]
end
