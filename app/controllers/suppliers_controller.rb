class SuppliersController < ApplicationController

	def index
		@suppliers = Supplier.all
	end

	def new
	end

	def create
		@supplier = Supplier.create({

			}]
	end

def show
		@supplier = Supplier.find(params[:id])
	end





	def edit
		@supplier = Supplier.find(params[:id])
	end

	def update
		@supplier = Supplier.find(params[:id])
		@supplier.update({
			}]
		redirect_to "/suppliers/#{@supplier.id}"
	end

end
