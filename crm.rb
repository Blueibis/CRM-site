require 'sinatra'
require_relative 'note'
require_relative 'contact'
require 'pry'


get '/' do
  erb :index
end

get '/contacts' do
  @contacts = Contact.all
  # @contact_note = Note.all
  erb :contacts
end

get '/about_me' do
  erb :about
end
after do
  ActiveRecord::Base.connection.close
end
