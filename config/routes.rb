Rails.application.routes.draw do
  get 'home/new'
  get 'users/show'
  get 'books/show'
  get 'books/index' => 'books#index'
  get 'books/new'
  get 'books/edit'
  get 'home/index'
  devise_for :users
  #ホーム画面に向かう
  root :to => 'homes#index'
  resources :books, only: [:show, :edit, :update, :index, :destroy, :create]
  resources :users, only: [:show, :edit, :update, :index]
  get 'home/about' => 'homes#about'
end
