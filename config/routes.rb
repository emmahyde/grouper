Rails.application.routes.draw do
  root 'feeds#main_feed'

  resources :users, only: %i[new create]
  resources :sessions, only: %i[new create destroy]
  resources :posts

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  get 'up' => 'rails/health#show', as: :rails_health_check

  # authorization flows
  get 'registration',  to: 'users#new'
  post 'registration', to: 'users#create'

  get 'login',         to: 'sessions#new'
  post 'login',        to: 'sessions#create'

  delete 'logout',     to: 'sessions#destroy'

  # visitable pages
  resources :users
  resources :friendships do
    collection do
      post :accept
    end
  end
end
