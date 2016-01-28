class Product < ActiveRecord::Base

belongs_to :user
belongs_to :supplier
has_many :images
has_many :orders

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
		"$ #{tax.round(2)}"

	end

	def total
		tax = price * 0.09
		total = price + tax
		"$ #{total.round(2)}"
	end

	def get_the_first_image
		if images.first
			images.first.url
		end
	end

end
