get '/' do
	@artwork = Artwork.all
	
	erb :index
end