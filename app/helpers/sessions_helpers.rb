helpers do

	def login(user)
	  session[:user_id] = user.id
	end

	def logout
	  session[:user_id] = nil
	end

	def logged_in?
	  !!session[:user_id]
	end

	def current_user
	  @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
	end
end
