post '/search' do
	@search_request = params[:search_request]
	redirect "/search/results_for/#{@search_request}"
end

get '/search/results_for/:search_request' do
	@search_request = params[:search_request]
	@results = (search_artists(@search_request) ).uniq
	# + search_firstnames(@search_request) + search_lastnames(@search_request) + search_emails(@search_request)
	if request.xhr?
		content_type :json
	(erb :"search/results", layout: false, locals: {results: @results}).to_json
	else
		erb :"search/results"
	end
end