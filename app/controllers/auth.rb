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
	if params[:password_hash0] == params[:password_hash1]
		if @user.save!
			login(@user)
			redirect "/users/#{@user.id}"
		else
			@error = "Count not authenticate information.  Try again."
			redirect '/'
		end
	else
		# TO DO:  User errors are not rendering... why?
      @error = "Count not authenticate information.  Try again."
    redirect '/'
	end
end

#-------------------READ-------------------

get '/users/:id' do
	@user = User.find(params[:id])

	erb :'users/show'
end

#------------------UPDATE------------------

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :"/users/edit"  
end

put '/users/:id' do
  @user = User.find(params[:id])
  if @user
    @user.update_attributes(username: params[:username],
                     password: params[:password_hash0],
                     email: params[:email],
                     first_name: params[:first_name],
                     last_name: params[:last_name],
                     city: params[:city],
                     state: params[:state],
                     bio: params[:bio],
                     avatar: params[:avatar_url]
                     )

    redirect "/users/#{params[:id]}"
  else

    redirect "/users/#{params[:id]}"
  end
end

#------------------DESTROY-----------------

get '/users/:id/delete' do
  @user = User.find(params[:id])
  erb :'/users/delete'
end

delete '/users/:id' do
  @user = User.find(params[:id])
  logout
  User.destroy(@user.id)
  redirect '/'
end

