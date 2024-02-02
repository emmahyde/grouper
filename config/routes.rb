Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  root 'feeds#main_feed'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  get 'main_feed', to: 'feeds#main_feed'

  get 'up' => 'rails/health#show', as: :rails_health_check

  # authorization flows
  get 'registration',  to: 'users#new'
  post 'registration', to: 'users#create'

  get 'login',         to: 'sessions#new'
  post 'login',        to: 'sessions#create'

  delete 'logout', to: 'sessions#destroy'

  # visitable pages
  resources :users, only: %i[new create show] do
    resource :profile, except: %i[destroy new] do
      collection do
        get :posts
        get :friends
        get :media
      end
    end
  end

  resources :sessions, only: %i[new create destroy]
  resources :posts
  resources :friendships do
    collection do
      post :accept
    end
  end
end
