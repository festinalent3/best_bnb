class Beast < Sinatra::Base

  get '/spaces/all' do
    @spaces = Space.all
    @user = current_user
    erb :'spaces/all'
  end

  get '/spaces/new' do
    if session[:user_id].nil?
      flash.keep[:notice] = 'Please sign in to add spaces'
      redirect to('/spaces/all')
    else
      erb :'spaces/new'
    end
  end

  post '/spaces' do
    @space = Space.create(
      title: params[:title],
      price: params[:price],
      description: params[:description],
      user: User.get(session[:user_id]))
    flash.keep[:notice] = 'Space added'
    redirect to '/spaces/all'
  end
end
