
gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm.sqlite3')


















class Contact

  @@contacts = []
  @@next_id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name,last_name,email,note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@next_id
    @@next_id += 1

  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name,last_name,email,note)
    new_contact = Contact.new(first_name,last_name,email,note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  def id
    @id
  end

  def email
    @email
  end

  def note
    @note
  end

  def first_name
    @first_name
  end

  def last_name
    @last_name
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contacts.each do |contact|
      if contact.id == id
        puts "#{contact.full_name}"
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute,value)
      if attribute == 'first_name'
        @first_name = value
      elsif attribute == 'last_name'
        @last_name = value
      elsif attribute == 'email'
        @email = value
      elsif attribute == "notes"
        @notes = value
      end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute,value)
      matched_contact = nil
    @@contacts.each do |contact|
      if attribute == 'first_name' && contact.first_name == value
         matched_contact = contact
      elsif attribute == 'last_name' && contact.last_name == value
        matched_contact = contact
      elsif attribute == 'email' && contact.email == value
        matched_contact = contact
      else
      end
    end
    return matched_contact
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.
  def first_name=(update_first_name)
    first_name = update_first_name
  end

  def last_name=(update_last_name)
    last_name = update_last_name
  end

  def email=(update_email)
    @email = update_email
  end

  def note=(update_note)
    @note = update_note
  end
end

# contact1 = Contact.new('Betty', 'Maker', 'bettymakes@gmail.com', 'Loves Pokemon')
# p contact.email
# contact.note = "Loves HTMl & CSS"
# p contact

 kirt = Contact.create('kirt','john','k@asdf.com','adsdf')
mary = Contact.create('mary','smith','m@asdf.com','asdf')
lisa = Contact.create('lisa','jack','l@asdf.com','asdf')
# bobby.update('first_name','bill')
# bobby.update('last_name','clinton')

# p bobby.full_name

# Contact.delete_all

# hillary = Contact.create('silly','girl','silly@girl','try_harder')

# p Contact.all

# bobby.delete

# p Contact.all
