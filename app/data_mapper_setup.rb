require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'models/user'

env = ENV['RACK_ENV'] || 'development'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/beast_#{env}")
DataMapper.finalize
DataMapper.auto_upgrade!

# Old setup below, doesn't work with coveralls, must specify development rack env in this file
# DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/beast_#{ENV['RACK_ENV']}")
