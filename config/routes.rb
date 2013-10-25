Sevendaysports::Application.routes.draw do
  get "teams/index"

  get "teams/new"

  get "teams/create"

  get "teams/show"

  get "teams/edit"

  get "teams/update"

  get "teams/destroy"

  devise_for :users
  resources :users
  resources :universities
  # match ':controller(/:action(/:id))(.:format)'
end
