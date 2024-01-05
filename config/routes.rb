Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad
  resources :comments
  resources :blogs
  resources :abouts

  resources :home_pages, only: [:show, :index]
  resources :services
  resources :contacts
  get 'country_code', to: 'contacts#country_code'
  resources :categories
 
end
