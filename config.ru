require 'rubygems'
require File.join(File.dirname(__FILE__), './app/app.rb')

Mail.defaults do
  delivery_method :smtp, {
    :port      => 587,
    :address   => "smtp.mailgun.org",
    :user_name => "teambeast@sandbox1ffb9f44402e4a22a2b8684804ee86d9.mailgun.org",
    :password  => "bossmanbeast",
  }
end

run Beast