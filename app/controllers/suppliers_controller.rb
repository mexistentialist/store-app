class SuppliersController < ApplicationController

	def supplier
		@suppliers = Supplier.all
		@dropdown = Product.all
	end

end
