Rails.application.routes.draw do


  root 'static#index'

  post '/search'=> 'static#search'
  get '/results' => 'static#result'
  devise_for :users

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
