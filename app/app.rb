env = ENV['RACK_ENV'] || 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'tilt/erb'
require 'mail'
require 'mailgun'

require_relative 'helpers'
require_relative 'server'
require_relative 'data_mapper_setup'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/spaces'
require_relative 'lib/email/email_confirmations'

# Dir[File.join(File.dirname(__FILE__), '..',  'email', '**/*.html')].sort.each do |file|
#   require file
# end

require_relative 'models/date_range'
