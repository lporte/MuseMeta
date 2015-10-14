#--------------------SEARCH BAR
post '/search' do
  search_request = params[:search_request]
  redirect "/search/results_for/#{params[:search_request]}"
end

get '/search/results_for/:search_request' do
  @query = params[:search_request]
  @artists = Artist.search(@query) 
  @artworks = Artist.assoc_artworks(@query) 
  @artwork = Artwork.search(@query) 
end

#--------------------REVERSE IMAGE SEARCH BAR

post "/image_search" do
  @filename = params[:file][:filename]
  file = params[:file][:tempfile]
  File.open("public/images/#{@filename}", 'wb') do |f|
     f.write(file.read)
  end

  @image = "public/images/#{@filename}"
  @matches = image_matches(@image)

  erb :'search/image_results'
end

get '/image_search/results_for' do
end
