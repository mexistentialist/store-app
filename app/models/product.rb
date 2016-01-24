class Product < ActiveRecord::Base

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
		# price.delete!("$") 
		tax = price * 0.09
		total = price + tax
		"$ #{total.round(2)}"
	end

end
