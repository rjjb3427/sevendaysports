Sevendaysports::Application.routes.draw do
  root to: 'static_pages#home'

  devise_for :users
  resources :users
  resources :universities
  resources :events

  resources :teams do
    resources :events
  end
  
  # match ':controller(/:action(/:id))(.:format)'
end
