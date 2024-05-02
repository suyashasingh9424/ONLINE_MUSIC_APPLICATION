Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    confirmations: 'users/confirmations'
  }

  # Custom routes for user management
  devise_scope :user do
    get 'users/profile', to: 'users/registrations#show', as: 'show_user_profile'
    get '/users/registration/view_all_users', to: 'users/registrations#view_all_users', as: :users_view_all_users
  end

  # Music-related routes
  resources :musics do
    member do
      get 'audio'
    end
  end
  get '/music_library', to: 'musics#music_library', as: 'music_library'
  get '/search', to: 'musics#search', as: 'search_musics'

  # Artist-related routes
  resources :artists

  # Home-related routes
  get 'homes/index'
  get 'homes/dashboard'
  root to: 'homes#index'
  get 'dashboard/:id', to: 'homes#dashboard', as: 'dashboard'
  resources :playlists
  get 'home/user_home_page', to: 'homes#user_home_page'

  resources :artists do
    member do
      get 'follow'
    end
  end
  # Health check route
  get 'up', to: 'rails/health#show', as: :rails_health_check
end
