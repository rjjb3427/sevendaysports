Sevendaysports::Application.routes.draw do
  root to: 'static_pages#home', controller: 'static_pages', action: 'home', as: 'root'

  match 'static_pages/contact', to: 'static_pages#contact', as: :contact

  devise_for :users
  resources :universities
  resources :events
  resources :articles
  resources :medias

  resources :events do
    resources :articles
    resources :medias
  end

  resources :universities do 
    resources :teams 
  end

  resources :teams do
    resources :events
  end

  resources :users do
    resources :medias
  end

  resources :teams do
    resources :medias
  end

  resources :events do
    resources :medias
  end
  
  # match ':controller(/:action(/:id))(.:format)'
end
