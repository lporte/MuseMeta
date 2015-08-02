helpers do
	def search_artists(artist)
		@artwork = Artwork.where('artist LIKE ?', "%#{artist}%")
	end

	# def search_title(title)
	# 	@artwork = Artwork.where('title LIKE ?', "%#{title}%")
	# end

	# def search_museum(museum)
	# 	@artwork = Artwork.where('museum LIKE ?', "%#{museum}%")
	# end

	# def search_username(username)
	# 	@artwork = Artwork.where('username LIKE ?', "%#{username}%")
	# end
end