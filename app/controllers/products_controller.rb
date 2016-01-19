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
		flash[:success] = "Product added."
		redirect_to "/"
		@product = @products
	end

	def show
		@product = Product.find(params[:id])
		@title = @product.name
		@product = @products
	end

	def edit
		@product = Product.find(params[:id])
		@product = @products
	end

	def update
		@product = Product.find(params[:id])
		@product.update({name: params[:name], 
								price: params[:price], 
								description: params[:description], 
								image: params[:image]})
		flash[:success] = "Product updated."
		redirect_to "/products/#{@product.id}"
		@product = @products
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		@product = @products
		flash[:danger] = "Okay, you're the boss. Item deleted."
		redirect_to "/"
 	end

end
