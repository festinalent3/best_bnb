require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'tilt/erb'
require_relative 'data_mapper_setup'
require_relative 'controllers/users'

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

  # start the server if ruby file executed directly
  run! if app_file == $0
end
