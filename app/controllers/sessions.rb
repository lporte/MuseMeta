#--------------LOGIN-------------------
get '/sessions/new' do
	@user = User.new()
	erb :'sessions/new'
end

post '/sessions' do
	@user = User.authenticate(params[:username], params[:password_hash0])
	if @user
	  login(@user)

	  redirect "/"
	else
	  # TO DO:  User errors are not rendering...
	  @error = "Oh Noes:  Username or Password is Incorrect"
	  erb :'index'
	end
end

#--------------LOGOUT-----------------
delete '/sessions' do
	logout
	redirect '/'
end