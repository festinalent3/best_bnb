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
      create_new_space
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
      update_space
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
      add_first_request
   else
     add_more_requests
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
    book_space_these_dates
    redirect '/spaces/confirmations/booked'
  end
end
