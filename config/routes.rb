Sevendaysports::Application.routes.draw do
  root to: 'static_pages#home'
  match 'static_pages/contact', to: 'static_pages#contact', as: :contact

  devise_for :users
  resources :users
  resources :universities
  resources :calendars
  resources :articles
  resources :medias

  resources :events do
    resources :articles
    resources :medias
  end

  resources :teams do
    resources :events
  end
  
  # match ':controller(/:action(/:id))(.:format)'
end
