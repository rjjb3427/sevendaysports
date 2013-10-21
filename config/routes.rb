Sevendaysports::Application.routes.draw do
  devise_for :users
  resources :users
  # match ':controller(/:action(/:id))(.:format)'
end
