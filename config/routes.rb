Sevendaysports::Application.routes.draw do
  devise_for :users
  resources :users
  resources :universities
  # match ':controller(/:action(/:id))(.:format)'
end
