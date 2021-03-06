class Beast < Sinatra::Base
  register Sinatra::Flash
  register Sinatra::Partial
  use Rack::MethodOverride

  helpers Helpers

  set :partial_template_engine, :erb
  enable :partial_underscores
  enable :sessions
  set :session_secret, 'super secret'

end
