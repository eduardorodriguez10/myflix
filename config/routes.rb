Myflix::Application.routes.draw do
  resources :categories, only: [:index, :show]

  resources :users, only: [:create]
  resources :videos, only: [:index, :show] do 
    collection do 
      get 'search', to: 'videos#search'
    end
  end

  get '/', to: 'root#front', as: 'root'
  get '/sign_in', to: 'sessions#new', as: 'signin'
  post '/login', to: 'sessions#create', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/register', to: 'users#new', as: 'register'
  get '/index', to: 'videos#index', as: 'index'
  get '/video/:id', to: 'videos#show', as: 'videoshow'
  get '/genre', to: 'categories#index', as: 'genre'
  get '(:action)', controller: 'root'
  get 'ui(/:action)', controller: 'ui'
end
