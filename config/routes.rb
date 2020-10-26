Rails.application.routes.draw do
  
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'

  get '/login', to:'sessions#new'
  post 'login', to:'sessions#create'
  #delete 'login', to:'sessions#destroy'
  get '/logout', to:'sessions#destroy'
  #post 'blog#delete'

 #get 'blogs/index'
 #get 'blogs/new'
 #get 'blogs/create'
 #get 'blogs/show'
 #get 'blogs/edit'
 #get 'blogs/update'
 #get 'blogs/destroy'
 #delete 'blogs/destroy'
 resources :users
 resources :blogs do
  resources :comments, only: [:create, :destroy]
 end
 root 'blogs#index'
 resources :blogs
 delete 'login', to:'sessions#destroy'

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

