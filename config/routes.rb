Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "user_score/graph", to: 'user_score#graph', as: 'graph'
  get "user_score/day_graph", to: 'user_score#day_graph', as: 'day_graph'
  get "user_score/update_score", to: 'user_score#update_score', as: 'update_score'
  get "user_score/exercise_score", to: 'user_score#exercise_score', as: 'exercise_score'
  get "user_score/food_score", to: 'user_score#food_score', as: 'food_score'

resources :user do

resources :user_param
end

end
