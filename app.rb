require 'sinatra/base'

class Beast < Sinatra::Base
  get '/' do
    'Hello Beast!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
