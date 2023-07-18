Rails.application.routes.draw do
  get '/jobs', to: 'jobs#index', as: :jobs

  get '/login', to: 'sessions#new', as: :login
  get '/logout', to: 'sessions#destroy', as: :logout
  post '/login', to: 'sessions#create'

  get '/register', to: 'users#new', as: :new_user
  post '/register', to: 'users#create', as: :create_user

  get "/jobs/:id/delete", to: "jobs#delete", as: :delete_job


  resources :jobs

end
