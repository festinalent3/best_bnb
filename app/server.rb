class Beast < Sinatra::Base

  register Sinatra::Flash
  register Sinatra::Partial
  set :partial_template_engine, :erb
  enable :sessions
  enable :partial_underscores
  set :session_secret, 'super secret'

  get '/' do
    'Hello Beast!'
  end
  
end