class ProductsController < ApplicationController

	def all_products
		@products = Product.all
		@title = "All Products"
	end

	def random
		@products = Product.all.sample
		@title = "Random product"
	end

end
