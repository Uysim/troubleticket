Rails.application.routes.draw do
  resources :troubles
  resources :clients
  devise_for :users
  root 'pages#home'
end
