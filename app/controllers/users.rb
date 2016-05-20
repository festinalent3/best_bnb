class Beast < Sinatra::Base

  get '/users/new' do
    @user = User.new
    erb :'/users/new', :layout => false
  end

  post '/users' do
    create_new_user
    if @user.save
      EmailConfirmation.sign_up(@user.email)
      session[:user_id] = @user.id
      redirect('/spaces/all')
    else
      flash.now[:errors] = @user.errors.full_messages
      redirect '/users/new'
    end
  end

end
