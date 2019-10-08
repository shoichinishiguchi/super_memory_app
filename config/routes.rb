Rails.application.routes.draw do
  root 'questions#index'
  resources :questions, only: [:index, :new, :create]
  resources :users, only: [:new, :create]
  get '/users', to: 'users#new'
  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post 'correct/:question_id', to: 'question_operations#correct'
  post 'wrong/:question_id', to: 'question_operations#wrong'
  post 'importance_change/:question_id', to: 'question_operations#importance_change'
end
