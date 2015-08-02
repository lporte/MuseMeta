#--------------LOGIN-------------------
get '/sessions/new' do
	@user = User.new()
	erb :'sessions/new'
end

post '/sessions' do
	@user = User.authenticate(params[:username], params[:password_hash0])
	if @user
	  login(@user)

	  redirect "/users/#{@user.id}"
	else
	  # TO DO:  User errors are not rendering...
	  @error = "Username or Password is Incorrect"

	  redirect 'sessions/new'
	end
end

#--------------LOGOUT-----------------
delete '/sessions' do
	logout
	redirect '/'
end