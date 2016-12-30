Rails.application.routes.draw do
  resources :troubles, except: [:edit, :update] do
    put :assign
    put :work
    put :close
  end
  resources :clients
  devise_for :users
  root 'pages#home'
  resources :users
end
