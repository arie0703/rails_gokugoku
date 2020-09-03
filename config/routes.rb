Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'hello/index' => 'hello#index'

  get 'hello/link' => 'hello#link'

  get 'users/sign_in' => 'users#settions'

  get 'posts' => 'posts#index'

  get 'posts/new' => 'posts#new'

  get 'posts/search' => 'posts#search'

  post 'posts' => 'posts#create'

  get 'posts/:id' => 'posts#show',as: 'post'
    
  patch 'posts/:id' => 'posts#update'

  delete 'posts/:id' => 'posts#destroy'
  
  get 'posts/:id/edit' => 'posts#edit', as:'edit_post'

  root 'hello#index'

  get 'beer/index' => 'beer#index'

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end

end
