helpers do

	def search_artwork(title)
		Artwork.where('title LIKE ?', "%#{title}%")
	end

	def search_title(title)
		Artwork.where('title LIKE ?', "%#{title}%")
	end

	def search_museum(name)
		Museum.where('name LIKE ?', "%#{name}%")
	end

	def search_username(username)
		User.where('username LIKE ?', "%#{username}%")
	end

	def search_artist(name)
		Artist.where('name LIKE ?', "%#{name}%")
	end
	
end
