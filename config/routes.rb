Rails.application.routes.draw do
  resources :futsals
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "futsals#index" 
end
