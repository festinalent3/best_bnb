class Beast < Sinatra::Base

	get '/sessions/new' do
	 	erb :'sessions/new'
	end

	post '/sessions' do
	  user = User.authenticate(params[:email], params[:password])
	  if user
			@spaces = Space.all
	  	session[:user_id] = user.id
	    redirect to('/spaces/all')
	  else
	    flash.now[:errors] = ['The email or password is incorrect']
	    erb :'sessions/new'
	  end
	end

	delete '/sessions' do
		@spaces = Space.all
	  session[:user_id] = nil
	  flash.keep[:notice] = 'goodbye!'
	  redirect to '/spaces/all'
	end
end
