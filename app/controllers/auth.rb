get '/users' do
	@users = User.all.reverse_order

	erb :'users/all'
end

#----------------CREATE/SIGNUP-------------
get '/users/new' do
	@user = User.new
	erb :'users/new'
end

post '/users' do
	if params[:password_hash0] == params[:password_hash1]
		@user = User.new(username: params[:username],
	                     password: params[:password_hash0],
	                     email: params[:email],
	                     first_name: params[:first_name],
	                     last_name: params[:last_name],
	                     city: params[:city],
	                     state: params[:state],
	                     bio: params[:bio],
	                     avatar: params[:avatar_url]
	                     )
		if @user.save!
			login(@user)
			redirect "/users/#{@user.id}"
		else
			redirect '/users/new'
		end
	end
end

#-------------------READ-------------------

get '/users/:id' do
	@user = User.find(params[:id])
	erb :'users/show'
end
#------------------UPDATE------------------
#------------------DESTROY-----------------