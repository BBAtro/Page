Rails.application.routes.draw do

  concern :commentable do
    resources :comments, only: %i[create destroy]
  end

  root 'pages#index'

  resources :posts, concerns: :commentable, except: %i[edit update] do 
    resources :comments, only: %i[create destroy]
  end
  

  resources :users, only: %i[index show new create edit update]

  # get '/users/:id', to: 'users#show'


  resource :session, only: %i[new create destroy]

end
