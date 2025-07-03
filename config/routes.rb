Rails.application.routes.draw do
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :books do
    resources :reviews, only: [ :create, :destroy ]
    
  end
  resources :users, only: [] do
    resources :books, only: :index, controller: 'user_books'
  end

 
  get "up" => "rails/health#show", as: :rails_health_check
  root "books#index"
end
