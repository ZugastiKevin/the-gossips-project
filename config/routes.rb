Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get '/name', to: 'destination'

  root 'gossips#index'
  get '/contact', to: 'statics#contact'
  get '/team', to: 'statics#team'
  get '/landing', to: 'statics#landing'


  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #get '/user', to: 'static#user'

  resources :gossips do
    resources :comments
  end

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :cities
end
