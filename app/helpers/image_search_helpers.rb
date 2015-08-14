require 'phashion'

helpers do

	def load_images
		Dir.glob("public/images/*")
	end

	def image_matches(input_img)
		@matches = []
		all_images = load_images
		img1 = Phashion::Image.new(input_img)
		
		all_images.each do |dir_img|
			img2 = Phashion::Image.new(dir_img)
			if img1.duplicate?(img2) 
				@matches << dir_img
			elsif img1.distance_from(img2) <= 15
				@matches << dir_img
			end
		end
		return @matches
	end

	def artwork_id(url)
		img_name = url.gsub(/^public\/images\//, "")
		@artwork = Artwork.find_by(img_url: img_name )
	end
end
