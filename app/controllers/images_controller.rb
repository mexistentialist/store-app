class ImagesController < ApplicationController

	def images
		@images = Image.find(params[id])
	end

end
