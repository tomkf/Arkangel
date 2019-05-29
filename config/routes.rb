Rails.application.routes.draw do
  get 'user_score/new'
  get 'user_score/create'
  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
