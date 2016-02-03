class Product < ActiveRecord::Base

belongs_to :user
belongs_to :supplier
has_many :images
has_many :carted_products
has_many :orders, through: :carted_products

has_many :categorized_products
has_many :categories, through: :categorized_products

	def sale_method
		if price <= 2
			"Discount item!"
		else 
			"On sale!"
		end
	end

	def tax
		price
		tax = price * 0.09
		tax.round(2)

	end

	def total
		tax = price * 0.09
		total = price + tax
		total.round(2)
	end

	def get_the_first_image
		if images.first
			images.first.url
		end
	end

	
	def calc_subtotal(price)
		price * quantity
	end

	def calc_tax(tax_rate)
		subtotal * tax_rate
	end

	def calc_total
		subtotal + tax
	end

end
