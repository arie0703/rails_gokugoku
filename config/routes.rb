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

  #ビール

  get 'beers' => 'beers#index'

  get 'beers/new' => 'beers#new'

  get 'beers/search' => 'beers#search'

  post 'beers' => 'beers#create'

  get 'beers/:id' => 'beers#show',as: 'beer'
    
  patch 'beers/:id' => 'beers#update'

  delete 'beers/:id' => 'beers#destroy'
  
  get 'beers/:id/edit' => 'beers#edit', as:'edit_beer'

  #highball

  get 'highballs' => 'highballs#index'

  get 'highballs/new' => 'highballs#new'

  get 'highballs/search' => 'highballs#search'

  post 'highballs' => 'highballs#create'

  get 'highballs/:id' => 'highballs#show',as: 'highball'
    
  patch 'highballs/:id' => 'highballs#update'

  delete 'highballs/:id' => 'highballs#destroy'
  
  get 'highballs/:id/edit' => 'highballs#edit', as:'edit_highball'

  #food

  get 'foods' => 'foods#index'

  get 'foods/new' => 'foods#new'

  get 'foods/search' => 'foods#search'

  post 'foods' => 'foods#create'

  get 'foods/:id' => 'foods#show',as: 'food'
    
  patch 'foods/:id' => 'foods#update'

  delete 'foods/:id' => 'foods#destroy'
  
  get 'foods/:id/edit' => 'foods#edit', as:'edit_food'

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  #resources :beers do
  #  resources :likes, only: [:create, :destroy]
  #  resources :comments, only: [:create, :destroy]
  #end

end
