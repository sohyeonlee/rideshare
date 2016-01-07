Rails.application.routes.draw do
  get 'conversations/index'

  root 'static#index'

  devise_for :users

  resources :conversations, only: [:index, :show, :destroy]
  resources :messages, only: [:new, :create]
end
