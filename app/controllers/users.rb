class Beast < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'/users/new', :layout => false
  end

  post '/users' do
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if @user.save
      # Pony.mail to: params[:email],
      #      from: 'thebeastteam@beast.com',
      #      subject: 'Welcome to the BEAST!',
      #      body: "Thanks for signing up"
      session[:user_id] = @user.id
      redirect('/spaces/all')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb(:'users/new')
    end
  end

end
