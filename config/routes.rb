Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad
  resources :comments
  resources :blogs
  resources :home_pages, only: [:show, :index]
  resources :services
  resources :contacts, only: [:create]
  resources :categories
 
end
