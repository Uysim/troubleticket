Rails.application.routes.draw do
  resources :troubles do
    put :assign
  end
  resources :clients
  devise_for :users
  root 'pages#home'
  resources :users
end
