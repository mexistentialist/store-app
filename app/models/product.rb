class Product < ActiveRecord::Base

	def sale_method
		if price.delete("$").to_f <= 2
			"Discount item!"
		else 
			"On sale!"
		end
	end

	def tax
		price.delete!("$") 
		tax = price.to_f * 0.09
		"$ #{tax.round(2)}"

	end

	def total
		# price.delete!("$") 
		tax = price.to_f * 0.09
		total = price.to_f + tax
		"$ #{total.round(2)}"
	end

end
