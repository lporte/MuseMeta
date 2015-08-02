#----------------SHOW ALL-----------------

get '/artworks' do
	@artworks = Artwork.all.order(id: :asc)
	erb :artworks
end

#-----------------CREATE-----------------

get '/artworks/new' do
	@artwork = Artwork.new
	erb :'artworks/new'
end

post '/artworks' do
	@artwork = Artwork.new(
		title: params[:title],
		source: params[:source],
		date: params[:date]
		)
	if @artwork.save
		redirect "/artworks/#{@artwork.id}"
	else
		status 400
		erb :'artworks/new'
	end
end

#----------------SHOW----------------

get '/artworks/:id' do
	@artwork = Artwork.find(params[:id])
	erb :'artworks/show'
end

#----------------EDIT----------------

get '/artworks/:id/edit' do
	@artwork = Artwork.find(params[:id])
	erb :"artworks/edit"
end

put '/artworks/:id' do
	@artwork = Artwork.find(params[:id])
	@artwork.update_attributes(
	  	title: params[:title],
	  	artist: params[:artist],
	  	url: params[:url],
	)
	# @artwork.save
	redirect "/artworks/#{@artwork.id}"
end

#----------------DELETE---------------

delete '/artworks/:id' do
	@artwork = Artwork.find(params[:id])
	@artwork.destroy
	redirect "/artworks"
end