class Beast < Sinatra::Base

  get '/spaces/new' do
    if session[:user_id].nil?
      flash.keep[:notice] = 'Please sign in to add spaces'
      redirect to('/spaces/all')
    else 
      erb :'/spaces/new'
    end
  end

  post '/spaces' do 
    @space = Space.create
    flash.keep[:notice] = 'Space added'
    redirect to '/spaces/all'
  end
end