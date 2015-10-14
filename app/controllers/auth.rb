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
    if params[:password_hash0] == params[:password_hash1] && @user.save
      login(@user)
      redirect "/users/#{@user.id}"
    else
      @error = "Could not authenticate information.  Try again."
      erb :index
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
      avatar: params[:avatar_url])
  end
  redirect "/users/#{params[:id]}"
end

#------------------DESTROY-----------------

get '/users/:id/delete' do
  unless !current_user
    @user = User.find(params[:id])
    erb :'/users/delete'
  end
  redirect '/'
end

delete '/users/:id' do
  unless !current_user
    @user = User.find(params[:id])
    logout
    User.destroy(@user.id)
  end
  redirect '/'
end

