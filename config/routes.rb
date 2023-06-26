Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'pages#index'

  resources :posts do 
    resources :comments, only: %i[edit update create destroy]
  end
  

  resources :users, only: %i[index new create edit update]

  resource :session, only: %i[new create destroy]

end
