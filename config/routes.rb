Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#index'

  resources :posts #, only: %i[ destroy index new create edit update show ]
  

  resources :users, only: %i[index new create edit update]

  resource :session, only: %i[new create destroy]

end
