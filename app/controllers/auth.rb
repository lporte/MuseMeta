# Question:  should sessions be partitioned in its own controller directory?
get '/sessions/new' do
	
	erb :'sessions/new'
end

post '/sessions' do
	@user = User.find_by(username: params[:username])
	session[:user_id] = @user.user_id

	redirect "/users/#{@user.id}"
end


