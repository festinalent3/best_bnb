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
    if DateRange.new(params[:from_date], params[:to_date]).range
      @space = Space.create(
        title: params[:title],
        price: params[:price],
        description: params[:description],
        available_dates: DateRange.new(params[:from_date], params[:to_date]),
        user: User.get(session[:user_id]))
      flash.keep[:notice] = 'Space added'
      redirect to '/spaces/all'
    else
      redirect to('/spaces/new')
    end
  end
end
