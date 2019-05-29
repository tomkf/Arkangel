Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  get "user_score/graph", to: 'user_score#graph', as: 'graph'

  resources :user_score

end
