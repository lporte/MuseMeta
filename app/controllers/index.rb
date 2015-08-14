get '/' do
	@artwork = Artwork.order(:date, :asc)
	erb :index
end