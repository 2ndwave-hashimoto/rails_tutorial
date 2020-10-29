Rails.application.routes.draw do
  devise_for :comments
  resources :blogs
  root 'blogs#index'
  resources :users
  #get 'users/index'
  #get 'users/new'
  #get 'users/create'
  #get 'users/show'
  #get 'users/edit'
  #get 'users/update'
  #get 'users/destroy'

  get '/login', to:'sessions#new'
  post 'login', to:'sessions#create'

  get '/logout', to:'sessions#destroy'
 
 resources :blogs do
  resources :comments, only: [:create, :destroy]
 end
 
 
 delete 'login', to:'sessions#destroy'

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

