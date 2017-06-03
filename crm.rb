require 'sinatra'
require_relative 'contact'
require_relative 'note'


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

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  @note = Note.find_by(contact_id: params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/add_contact' do
  @contacts = Contact.all
  erb :add_contact
end

post '/addcontact' do
  @contacts = Contact.all
  new_contact = Contact.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email])
  Note.create(body: params[:note], written_at: Time.now, contact_id: new_contact.id)
  erb :contacts
end

post '/update_contact/:id' do
  @contacts = Contact.all
  contact = Contact.find(params[:id])
  note = Note.find_by(contact_id: params[:id])
  contact.update(first_name: params[:first_name])
  contact.update(last_name: params[:last_name])
  contact.update(email: params[:email])
  note.update(body: params[:note])
  erb :contacts
end

get '/delete/:id' do
  @contacts = Contact.all
  contact = Contact.find(params[:id])
  note = Note.find_by(contact_id: params[:id])
  contact.delete
  note.delete
  erb :contacts
end

after do
  ActiveRecord::Base.connection.close
end
