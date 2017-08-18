class Contact
  @@contact = []
  @@id = 1


  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1
  end


  # This method should return all of the existing contacts
  def self.all
    @@contact

  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@contact.each do |contact|
      if contact_id_reader == id
        return contact
      end
    end

  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update
   puts "What do you want to update"
   gets.chomp
   if gets.chomp == "first_name"
     puts "What do you want to change to?"
     gets.chomp
    gets.chomp = first_name_edited
    @@contact.each do |contact|
      if contact == first_name
        return contact

   @@first_name
   @@last_name
   @@email
   @@note
 end
end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    @email = email
    @@contact.each do | contact |
      if attribute == first_name && contact.first_name == value
        return contact
      elsif attribute == last_name && contact.last_name == value
      elsif attribute == email && contact.email == value
      else
        attribute == notes && contact.notes == value

      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts.clear
  end

  def email
      @email
  end

  def email=(email)
    @email = email
  end

  def note=(note)
    @note = note
  end

  def full_name
    "#{full_name} #{last_name}"

  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete(first_name)
    @@contact.delete_if {|first_name| first_name == first_name}
  end

  # Feel free to add other methods here, if you need them.

end

p Contact.find_by(first_name, john)
