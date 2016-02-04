Rails.application.routes.draw do
  
  devise_for :users
  root to: 'products#index'
  get '/products/random' => 'products#random'
  post '/search' => 'products#search'

  get '/products' => 'products#index'

  get '/products/new' => 'products#new'
  post '/products' => 'products#create'
  get '/products/:id' => 'products#show'
  get '/products/:id/edit' => 'products#edit'
  patch 'products/:id' => 'products#update'
  delete 'products/:id' => 'products#destroy'

#------------------------------------------
  get '/suppliers/index' => 'suppliers#index'

  get '/suppliers/new' => 'suppliers#new'
  post '/suppliers' => 'suppliers#create'

  get 'suppliers/:id' => 'suppliers#show'

  get 'suppliers/:id/edit' => 'suppliers#edit'
  patch 'suppliers/:id' => 'suppliers#update'

  delete 'suppliers/:id' => 'suppliers#destroy'
#------------------------------------------
  
  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'

#------------------------------------------
  get '/carts' => 'carted_products#index'
  post '/carts' => 'carted_products#create'
  delete '/carts/:id' => 'carted_products#destroy'


  # get '/images/index' => 'images#index'

  # get '/images/new' => 'images#new'
  # post '/images' => 'images#create'

  # get 'images/:id' => 'imagesimages#show'

  # get 'images/:id/edit' => 'imagesimages#edit'
  # patch 'images/:id' => 'images#update'

  # delete 'images/:id' => 'images#destroy 


end
