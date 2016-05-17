class Beast < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'/users/new'
  end

  post '/users' do
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    session[:user_id] = @user.id
    @user.save ? redirect('/spaces/all') : erb(:'users/new')
  end

end
