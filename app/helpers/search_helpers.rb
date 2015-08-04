helpers do
	def search_artwork(title)
		@result = Artwork.where('title LIKE ?', "%#{title}%")
	end

	def search_title(title)
		@result = Artwork.where('title LIKE ?', "%#{title}%")
	end

	def search_museum(name)
		@result = Museum.where('name LIKE ?', "%#{name}%")
	end

	def search_username(username)
		@result = User.where('username LIKE ?', "%#{username}%")
	end

	def search_artist(name)
		@result = Artist.where('name LIKE ?', "%#{name}%")
	end
end
