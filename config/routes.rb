Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  get '/success', to: 'sessions#success'
  get '/logout', to: 'sessions#logout'

  get '/login', to: 'sessions#login'

  #google authentication routes
  get '/signup', to: 'sessions#signup'
  get 'auth/:provider/callback', to: 'sessions#googleAuth'
  #get ‘auth/failure’, to: redirect(‘/’)
  
end
