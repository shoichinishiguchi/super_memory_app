Rails.application.routes.draw do
  root 'questions#index'
  resources :questions, only: [:index, :new, :create]
end
