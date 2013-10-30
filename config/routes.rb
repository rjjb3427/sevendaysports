Sevendaysports::Application.routes.draw do
  devise_for :users
  resources :users
  resources :universities
  resources :teams
  resources :events

  resources :events_teams do
    resources :events
  end
  

  # match ':controller(/:action(/:id))(.:format)'
end
