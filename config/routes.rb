Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :futsals
  resources :booking
  resources :settings, only: %i[index create]
  resources :contact, only: %i[index]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "futsals#index" 
  post '/verify_payment', to: 'booking#payment'
end
