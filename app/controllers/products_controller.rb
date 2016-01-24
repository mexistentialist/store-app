class ProductsController < ApplicationController

	def index
		@products = Product.all
		@title = "All Products"
		
		@dropdown = Product.all

		if params[:sort] && params[:sort_order]
			@products = @products.order(params[:sort] => params[:sort_order])
		end
		if params[:discount]
			@products = @products.where("price < ?", params[:discount])
		end
	end

	def random
		@product = Product.all.sample
		@dropdown = Product.all

		render :show
	end

	def search
		@dropdown = Product.all

		@products = Product.where("name LIKE ? OR description LIKE ? OR price LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
		render :index
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
