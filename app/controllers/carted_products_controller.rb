class CartedProductsController < ApplicationController

		def index
			if user_signed_in? && current_user.carted_products.where(status: "carted").any?
				@carted_products = current_user.carted_products.where(status: "carted")
			else
				flash[:warning] = "Add stuff to your cart"
				redirect_to "/"
			end
		end

	def create
		product = Product.find(params[:product_id])

		@carted_product = CartedProduct.create({
		user_id: current_user.id,
		product_id: product.id,
		quantity: params[:quantity], 
		status: "Carted"
		})
		flash[:success] = "You've added a product to your cart"
# Add thing where 
		redirect_to "/carts"

	end

	def show
		@carted_product = CartedProduct.find(params[:id])
		@product = @carted_product.product
		
	end

	def destroy
		carted_product = CartedProduct.find(params[:id])
		carted_product.update(status: "Removed")
		redirect_to "/carts"
		
	end

end
