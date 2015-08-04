post '/search' do
	@search_request = params[:search_request]
	redirect "/search/results_for/#{@search_request}"
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