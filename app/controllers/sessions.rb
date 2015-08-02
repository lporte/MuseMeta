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
	  @error = "Username or Password is Incorrect"
	  p @error
	  p "*" * 100
	  redirect 'sessions/new'
	end
end

#--------------LOGOUT-----------------
delete '/session/:id' do
	@user = User.find_by(username: params[:username])
	logout(@user)
	redirect '/'
end