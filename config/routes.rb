Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
 resources :books do
  resources :reviews, only: [ :create, :destroy ]
 end
  get "up" => "rails/health#show", as: :rails_health_check
  root "books#index"
end
