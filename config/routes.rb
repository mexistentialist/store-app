Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  get '/products' => 'products#index'
  get '/:id' => 'products#random'

  get '/products/new' => 'products#new'
  post '/products' => 'products#create'

  get '/products/random' => 'products#random'
  get '/products/:id' => 'products#show'

  get '/products/:id/edit' => 'products#edit'
  patch 'products/:id' => 'products#update'

  delete 'products/:id' => 'products#destroy'

  post '/search' => 'products#search'
#------------------------------------------
  get '/suppliers/index' => 'suppliers#index'

  get '/suppliers/new' => 'suppliers#new'
  post '/suppliers' => 'suppliers#create'

  get 'suppliers/:id' => 'suppliers#show'

  get 'suppliers/:id/edit' => 'suppliers#edit'
  patch 'suppliers/:id' => 'suppliers#update'

  delete 'suppliers/:id' => 'suppliers#destroy'
#------------------------------------------
  # get '/images/index' => 'images#index'

  # get '/images/new' => 'images#new'
  # post '/images' => 'images#create'

  # get 'images/:id' => 'imagesimages#show'

  # get 'images/:id/edit' => 'imagesimages#edit'
  # patch 'images/:id' => 'images#update'

  # delete 'images/:id' => 'images#destroy 


end
