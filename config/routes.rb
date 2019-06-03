Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :user_score, only:[:update, :edit]
  resources :profile, only:[:index]


  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "user_score/graph", to: 'user_score#graph', as: 'graph'
  get "user_score/day_graph", to: 'user_score#day_graph', as: 'day_graph'


# create this fake route for the apis - I will create a table for the apis next week. Jose
  get 'apis', to: 'pages#apis', as: 'apis'

  Rails.application.routes.draw do
    # Sidekiq Web UI, only for admins.
    require "sidekiq/web"
    authenticate :user, lambda { |u| u.admin } do
      mount Sidekiq::Web => '/sidekiq'
    end
  end

end
