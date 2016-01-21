class ProductsController < ApplicationController

	def index
		@products = Product.all
		@title = "All Products"
		
		@dropdown = Product.all

	end

	def random
		@products = Product.all.sample
		@title = "Random product"
		@dropdown = Product.all
	end


	def new
				@dropdown = Product.all
	end

	def create
		@product = Product.create({name: params[:name],
					 			price: params[:price], 
					 			description: params[:description], 
					 			image: params[:image]})
		flash[:success] = "Product added."
		redirect_to "/"
		@dropdown = Product.all
	end

	def show
		@product = Product.find(params[:id])
		@title = @product.name
		@dropdown = Product.all
	end

	def edit
		@product = Product.find(params[:id])
		@dropdown = Product.all
	end

	def update
		@product = Product.find(params[:id])
		@product.update({name: params[:name], 
								price: params[:price], 
								description: params[:description], 
								image: params[:image]})
		flash[:success] = "Product updated."
		redirect_to "/products/#{@product.id}"
		@dropdown = Product.all
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		@products = @product
		flash[:danger] = "Okay, you're the boss. Item deleted."
		redirect_to "/"
 		@dropdown = Product.all
 	end

end
