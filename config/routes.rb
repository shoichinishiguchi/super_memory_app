Rails.application.routes.draw do
  root 'questions#index'
  resources :questions, only: [:index, :new, :create]
  resources :users, only: [:new, :create]
  get '/users', to: 'users#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
