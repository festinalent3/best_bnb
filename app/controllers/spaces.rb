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

  post '/spaces/new' do
    if DateRange.generate_range(params[:from_date], params[:to_date])
      @space = Space.create(
        title: params[:title],
        price: params[:price],
        description: params[:description],
        available_dates: DateRange.generate_range(params[:from_date], params[:to_date]),
        requested_dates: [],
        user: User.get(session[:user_id]))
      flash.keep[:notice] = 'Space added'
      redirect to '/spaces/all'
    else
      redirect to('/spaces/new')
    end
  end

  get '/spaces/edit' do
    @space_id = session[:space_id]
    erb :'spaces/edit'
  end

  post '/spaces/edit' do
    session[:space_id] = params[:space_id]
    redirect '/spaces/edit'
  end

  post '/spaces/update' do
    if DateRange.generate_range(params[:from_date], params[:to_date])
      @space = Space.get(params[:space_id].to_i)
      @space.update(
        :title => params[:title],
        :price => params[:price],
        :description => params[:description],
        :requested_dates => @space.requested_dates,
        :available_dates => DateRange.generate_range(params[:from_date], params[:to_date])
      )
      redirect '/spaces/all'
    else
      flash.keep[:notice] = 'You must update available dates!'
      redirect '/spaces/edit'
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
    if @space.requested_dates == []
      @space.update(:requested_dates => [DateRange.request_dates(params[:check_in_date],
      params[:check_out_date],
      session[:user_id])])
   else

    hashi = [@space.req_dates[0], DateRange.request_dates(params[:check_in_date],
    params[:check_out_date],
    session[:user_id])]
    @space.update(:requested_dates => hashi)


    # bajs = @space.req_dates
    # p 'BAJS'
    # p bajs
    # hashi = bajs << DateRange.request_dates(params[:check_in_date],
    # params[:check_out_date],
    # session[:user_id])
    # p 'HASHI'
    # p hashi
    # @space.update(:requested_dates => hashi)

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

  get '/spaces/confirmations/booked' do
    @space = Space.get(session[:space_id].to_i)
    erb :'/spaces/confirmations/booked'
  end

  post '/spaces/confirmations/booked' do
    session[:space_id] = params[:space_id]
    @space = Space.get(params[:space_id].to_i)
    @space.update(:available_dates => DateRange.book_dates(params[:check_in_date],
    params[:check_out_date],
    @space.available_dates))
    redirect '/spaces/confirmations/booked'
  end
end
