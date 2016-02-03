class ProductsController < ApplicationController

	def index
		@products = Product.all
		@title = "All Products"
		
		# @dropdown = Product.all

		if params[:sort] && params[:sort_order]
			@products = @products.order(params[:sort] => params[:sort_order])
		end
		if params[:discount]
			@products = @products.where("price < ?", params[:discount])
		end

		if params[:category]
			@products = Category.find_by(name: params[:category]).products
		end

	end

	def random
		@product = Product.all.sample
		# @dropdown = Product.all

		render :show
	end

	def search
		@products = Product.where("name LIKE ? OR description LIKE ? OR price LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
		render :index
	end

	def new
	end

	def create
		@product = Product.create({name: params[:name],
					 			price: params[:price], 
					 			description: params[:description], 
					 			supplier_id: params[:supplier][:supplier_id]})
		flash[:success] = "Product added."
		redirect_to "/"

		Image.create({url: params[:image], product_id: @product.id}) if params[:image] != ""

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
								description: params[:description] 
								})
		flash[:success] = "Product updated."
		redirect_to "/products/#{@product.id}"

		Image.create({url: params[:image], product_id: @product.id}) if params[:image] != ""

	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		@products = @product
		flash[:danger] = "Okay, you're the boss. Item deleted."
		redirect_to "/"
 	end

end
