
require 'active_record'
require 'mini_record'



ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')

class Contact < ActiveRecord::Base
  # attr_reader :id
  # attr_accessor :first_name, :last_name, :email, :note
  # @@contacts = []
  # @@id = 1
  # # This method should initialize the contact's attributes
  # def initialize(first_name, last_name, email, note = "I'm a contact")
  #   @first_name = first_name
  #   @last_name = last_name
  #   @email = email
  #   @note = note
  #   @id = @@id
  #   @@id += 1
  # end

  field :first_name, as: :string
  field :last_name,  as: :string
  field :email,      as: :string

  # This method should call the initializer,
  # store the newly created contact, and then return it
  # def self.create(first_name, last_name, email, note = "I'm a contact")
  #   new_contact = Contact.new(first_name, last_name, email, note = "I'm a contact")
  #   @@contacts << new_contact
  #   new_contact
  # end
  #
  # # This method should return all of the existing contacts
  # def self.all
  #   @@contacts
  # end
  #
  # # This method should accept an id as an argument
  # # and return the contact who has that id
  # def self.find(id)
  #   @@contacts.each do |contact|
  #     return contact if contact.id == id
  #   end
  # end
  #
  # # This method should allow you to specify
  # # 1. which of the contact's attributes you want to update
  # # 2. the new value for that attribute
  # # and then make the appropriate change to the contact
  # def update(attribute, value)
  #   case attribute
  #   when "first_name"
  #     self.first_name = value
  #   when "last_name"
  #     self.last_name = value
  #   when "email"
  #     self.email = value
  #   when "note"
  #     self.note = value
  #   end
  # end
  #
  # # This method should work similarly to the find method above
  # # but it should allow you to search for a contact using attributes other than id
  # # by specifying both the name of the attribute and the value
  # # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  # def self.find_by(attribute, value)
  #   @@contacts.each do |contact|
  #     return contact if contact.send(attribute) == value
  #   end
  # end
  #
  # # This method should delete all of the contacts
  # def self.delete_all
  #   @@contacts = []
  # end
  #
  def full_name
    "#{first_name} #{last_name}"
  end
  #
  # # This method should delete the contact
  # # HINT: Check the Array class docs for built-in methods that might be useful here
  # def delete
  #   @@contacts.delete(self)
  # end
  #
  # def self.delete_by_id(eyed)
  #   @@contacts.each do |contact|
  #     contact.delete if contact.id == eyed
  #   end
  # end
  #
  # def self.delete_by_attribute(attribute, value)
  #   @@contacts.each do |contact|
  #     contact.delete if contact.send(attribute) == value
  #   end
  # end
  #
  # def self.update(name, attribute, value)
  #     @@contacts.each do |contact|
  #     contact.first_name == name
  #     case attribute
  #       when "first_name"
  #         contact.first_name = value
  #       when "last_name"
  #         contact.last_name = value
  #       when "email"
  #         contact.email = value
  #       when "note"
  #         contact.note = value
  #       end
  #     end
  # end
  # # Feel free to add other methods here, if you need them.

end
at_exit do
  ActiveRecord::Base.connection.close
end

Contact.auto_upgrade!
