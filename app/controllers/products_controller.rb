class ProductsController < ApplicationController

	def index
		@products = Product.all
		@title = "All Products"
	end

	def random
		@products = Product.all.sample
		@title = "Random product"
	end


	def new
	end

	def create
		@product = Product.create({name: params[:name],
					 			price: params[:price], 
					 			description: params[:description], 
					 			image: params[:image]})
	end

	def show
		@product = Product.find(params[:id])
		@title = @product.name
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		@product.update({name: params[:name], 
								price: params[:price], 
								description: params[:description], 
								image: params[:image]})
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
	end

end
