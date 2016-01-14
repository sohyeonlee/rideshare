Rails.application.routes.draw do

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'static#index'

  get '/result' => 'static#result'
  post '/result' => 'static#result'
  patch '/search' => 'static#search'



  resources :users, only: [:index, :edit] do
    collection do
      get :rides
      patch :update_password
    end
  end

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
    end
  end

  resources :ride, only: [:index, :destroy, :edit, :create, :new, :update]

  resources :messages, only: [:new, :create]
end
