Rails.application.routes.draw do
  resources :troubles, except: [:edit, :update] do
    member do
      get :show_client
    end
    put :assign
    put :work
    put :close
  end
  resources :clients
  devise_for :users
  root 'pages#home'
  get :dashboard, to: 'pages#dashborad'
  resources :users
end
