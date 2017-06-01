require 'sinatra'
require_relative 'contact'

get '/' do
  erb :index
end
