# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new'

  post 'signup', to: 'users#create'
  get 'signup', to: 'users#new'

  post 'signin', to: 'sessions#create'
  get 'signin', to: 'sessions#new'

  delete 'logout', to: 'sessions#destroy'

  resources :groups
  resources :projects do 
    collection do
      get 'external'
    end
  end    

  resources :users, only: %w[new create show index]
end
