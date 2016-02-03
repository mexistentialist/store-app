class OrdersController < ApplicationController


	def create

		carted_products = current_user.carted_products.where(status: "carted")

		subtotal = 0
		quantity = ""
		carted_products.each do |carted_product|
			subtotal += carted_product.product.price * carted_product.quantity
			quantity = carted_product.quantity
		end

		tax = subtotal * 0.09
		total = subtotal + tax

		order = Order.create({
			user_id: current_user.id,
			subtotal: subtotal, 
			tax: tax, 
			total: total
			})

		carted_products.each do |carted_product|
			carted_product.update(order_id: order.id, status: "Purchased")
		end

		redirect_to "/orders/#{order.id}"
	end

	def show
		@order = Order.find(params[:id])
	end


end
