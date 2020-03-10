Rails.application.routes.draw do
  resources :projects
  root 'projects#index'

  post 'signup', to: 'users#create'
  get 'signup', to: 'users#new'

  post 'signin', to: 'sessions#create'
  get 'signin', to: 'sessions#new'

  delete 'logout', to: 'sessions#destroy'

  resources :users, only: %w[ new create show index ]
end
