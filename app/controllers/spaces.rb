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

  post '/spaces/request' do
    session[:space_id] = params[:space_id].to_i
    redirect '/spaces/request'
  end

  get '/spaces/request' do
    @space_id = session[:space_id]
    erb :'spaces/request'
  end

  post '/spaces/confirmations/request' do
    @space = Space.get(params[:space_id].to_i)
    
    if @space.requested_dates.nil?
      @space.update(:requested_dates => @space.available_dates.request_dates(params[:check_in_date],
      params[:check_out_date],
      session[:user_id]))
    else
      @space.update(:requested_dates => @space.requested_dates+(@space.available_dates.request_dates(params[:check_in_date],
      params[:check_out_date],
      session[:user_id])))
    end
    redirect '/spaces/confirmations/request'
  end

  get '/spaces/confirmations/request' do
    erb :'/spaces/confirmations/request'
  end

  get '/spaces/confirmations/pending' do
    @user = User.get(session[:user_id].to_i)
    erb :'/spaces/confirmations/pending'
  end
end
