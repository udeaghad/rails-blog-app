Rails.application.routes.draw do
  root "users#index"
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show, :new, :create] do 
          resources :comments, only: [:new, :create]
        end              
    end
    # get '/users/:user_id/posts/:post_id/new', to: 'comments#new', as: 'new_user_post_comment'
    # post '/users/:user_id/posts/:id', to: 'comments#create'

  end
