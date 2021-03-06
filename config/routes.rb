Rails.application.routes.draw do
  root 'pages#home'

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'

  resources :posts, only: [:new, :create, :index]
end
