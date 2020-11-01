Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  resources :users
  resources :articles
  resources :sessions, only: %i[new create show]

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'

end