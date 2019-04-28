Rails.application.routes.draw do
  resources :products
  resources :owners
  root 'pages#index'
  get '/developer' => 'pages#developer'
  get '/food_options' => 'foods#options'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
