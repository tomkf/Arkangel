Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "user_score/graph", to: 'user_score#graph', as: 'graph'
  get "user_score/day_graph", to: 'user_score#day_graph', as: 'day_graph'

  resources :user_score
end
