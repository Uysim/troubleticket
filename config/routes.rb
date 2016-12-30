Rails.application.routes.draw do
  resources :troubles do
    put :assign
    put :work
  end
  resources :clients
  devise_for :users
  root 'pages#home'
  resources :users
end
