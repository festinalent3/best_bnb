class Beast < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride
  set :partial_template_engine, :erb
  enable :partial_underscores
  enable :sessions
  set :session_secret, 'super secret'

  get '/' do
    'Hello Beast!'
  end
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
end