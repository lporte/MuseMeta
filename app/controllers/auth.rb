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
			p @user
			p "*" * 100
			redirect '/users/new'
		end
	else
		# TO DO:  User errors are not rendering... why?
		redirect '/users/new'
	end
end

#-------------------READ-------------------

get '/users/:id' do
	@user = User.find(params[:id])

	erb :'users/show'
end

#------------------UPDATE------------------

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

get '/users/:id/tweets' do
  redirect to "/users/#{params[:id]}"
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

