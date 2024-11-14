Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users, only: [:show, :allpost]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'hello#index'

  get 'hello/link' => 'hello#link'

  get 'users/sign_in' => 'users#settions'
  
  get 'users/:id/all_posts' => 'users#all_posts'

  get 'users/:id/all_likes' => 'users#all_likes'

  get 'users/:id/followings' => 'users#followings'

  get 'users/:id/followers' => 'users#followers'

  get 'posts' => 'posts#index'

  get 'posts/new' => 'posts#new'

  post 'posts' => 'posts#create'

  get 'posts/:id' => 'posts#show',as: 'post'
    
  patch 'posts/:id' => 'posts#update'

  delete 'posts/:id' => 'posts#destroy'
  
  get 'posts/:id/edit' => 'posts#edit', as:'edit_post'

  root 'hello#index'

  resources :users, only: [:index, :show] do
    collection do
      get :likes
    end
  end

  resources :relationships, only: [:create, :destroy]
  
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
