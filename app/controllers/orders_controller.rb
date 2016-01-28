class OrdersController < ApplicationController


	def create
			# @product = Product.find(params[:id])

	@order = Order.create({
		user_id: current_user.id,
		product_id: params[:product_id],
		quantity: params[:quantity],
		# subtotal: params[@product.price],
		# tax: params[:@product.total],
		# total: params[:total]
			})

			redirect_to "/orders/#{@order.id}"
	end

	def show
		@order = Order.find_by(id: params[:id])
	end


end
