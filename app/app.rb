env = ENV['RACK_ENV'] || 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'tilt/erb'
require 'pony'

require_relative 'helpers'
require_relative 'server'
require_relative 'data_mapper_setup'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/spaces'

require_relative 'models/date_range'
