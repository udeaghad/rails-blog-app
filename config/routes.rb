Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  root "users#index"
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show, :new, :create, :edit, :update, :destroy] do 
          resources :comments, only: [:new, :create, :edit, :update, :destroy]
          resources :likes, only: [:create]
        end              
    end 
    
    namespace :api, default: { format: :json} do
      namespace :v1 do
        resources :users, only: [:show] do
          resources :posts, only: [:index] do
            resources :comments, only: [:index, :create, :show]
        end
      end

    end

  end
