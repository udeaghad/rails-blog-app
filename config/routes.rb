Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
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
    
    namespace :api do
      namespace :v1 do
        post "/sign_in", to: 'users#sign_in'
        resources :users, only: [:index] do        
          resources :posts, only: [:index, :show] do
            resources :comments, only: [:index, :create]
          end
        end
      end
    end

  end
