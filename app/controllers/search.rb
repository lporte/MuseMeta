#--------------------SEARCH BAR
post '/search' do
	search_request = params[:search_request]
	redirect "/search/results_for/#{params[:search_request]}"
end

get '/search/results_for/:search_request' do
  @search_request = params[:search_request]
  @results = (
		search_artwork(@search_request) + 
		search_title(@search_request) + 
		search_museum(@search_request) + 
		search_username(@search_request) + 
		search_artist(@search_request) 
		).uniq
  @attr_array  = [] 
  erb :"search/results"
end

#--------------------REVERSE IMAGE SEARCH BAR

post "/image_search" do
  image_file = params[:image]
  erb :'search/image_results'
end

get '/image_search/results_for' do
  @filename = params[:file][:filename]
  file = params[:file][:tempfile]

  File.open("../public/images/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end
  
  erb :image_results
end