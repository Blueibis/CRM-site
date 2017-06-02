require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Note < ActiveRecord::Base
  field :contact_id, as: :integer
  field :body, as: :string
  field :written_at, as: :datetime
end

Note.auto_upgrade!
#for use in contacts.erb
#<% Note.all.each do |note| %>
#<% rightnote = nil %>
#<% rightnote = "Note: " + note.body if note.contact_id == contact.id %>
#<%= rightnote %>
#<% end %>
