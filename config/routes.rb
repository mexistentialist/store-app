Rails.application.routes.draw do

  get '/all-products' => 'products#all_products'
  get '/random' => 'products#random'

end
