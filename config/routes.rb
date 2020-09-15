Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: [:show, :allpost]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'hello/index' => 'hello#index'

  get 'hello/link' => 'hello#link'

  get 'users/sign_in' => 'users#settions'
  
  get 'users/:id/all_posts' => 'users#all_posts'

  get 'users/:id/followings' => 'users#followings'

  get 'users/:id/followers' => 'users#followers'

  get 'posts' => 'posts#index'

  get 'posts/new' => 'posts#new'

  get 'posts/search' => 'posts#search'

  post 'posts' => 'posts#create'

  get 'posts/:id' => 'posts#show',as: 'post'
    
  patch 'posts/:id' => 'posts#update'

  delete 'posts/:id' => 'posts#destroy'
  
  get 'posts/:id/edit' => 'posts#edit', as:'edit_post'

  root 'hello#index'

  #foto

  get 'fotos' => 'fotos#index'

  get 'fotos/new' => 'fotos#new'

  get 'fotos/search' => 'fotos#search'

  post 'fotos' => 'fotos#create'

  get 'fotos/:id' => 'fotos#show',as: 'foto'
    
  patch 'fotos/:id' => 'fotos#update'

  delete 'fotos/:id' => 'fotos#destroy'
  
  get 'fotos/:id/edit' => 'fotos#edit', as:'edit_foto'

  resources :users, only: [:index, :show] do
    collection do
      get :likes
      get :fotolikes
    end
  end

  resources :relationships, only: [:create, :destroy]

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :fotos do
    resources :fotolikes, only: [:create, :destroy]
    resources :fotocomments, only: [:create, :destroy]
  end
end
