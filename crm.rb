require_relative 'contact'
class CRM

  def initialize(name)
    @name = name
  end

    def main_menu
      while true
        print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
      end
    end

    def print_main_menu
      puts '[1] Add a new contact'
      puts '[2] Modify an existing contact'
      puts '[3] Delete a contact'
      puts '[4] Display all the contacts'
      puts '[5] Search by attribute'
      puts '[6] Exit'
      puts 'Enter a number: '
    end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    when 6 then abort("peace")
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp
    print 'Enter Last Name: '
    last_name = gets.chomp
    print 'Enter Email Address: '
    email = gets.chomp
    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print "Enter the first name of the contact, you would like to modify? "
    user_selection = gets.chomp.to_s
    contact = Contact.find_by('first_name',user_selection)
    if contact == nil
      puts "ops! not a contact!"
    else
      puts "You have selected contact #{contact.full_name}"
      puts '[1] Modify last_name'
      puts '[2] Modify first_name'
      puts '[3] Modify email'
      puts '[4] Modify notes'

      puts 'Enter a Number'

      user_selected = gets.chomp.to_i
      attribute = nil
      if user_selected == 1
        attribute = 'last_name'
      elsif user_selected == 2
          attribute = 'first_name'
      elsif user_selected == 3
          attribute = 'email'
      elsif user_selected == 4
          attribute = 'notes'
      end
      puts "Enter in new value"
      value = gets.chomp.to_s
      contact.update(attribute,value)

    end
  end

  def delete_contact
    print "Enter the first name of the contact, you would like to delete? "
    user_selection = gets.chomp.to_s
    contact = Contact.find_by('first_name',user_selection)
    if contact == nil
      puts "ops! not a contact!"
    else
      contact.delete
      puts "Contact has been delted"
    end
  end

  def display_all_contacts
      Contact.all.each do |contact|
      puts  "full_name = #{contact.full_name}"
      end
  end

  def search_by_attribute
    print "Enter the attribute you would like to search by: "
    atrribute = gets.chomp.to_s
    print "Enter the value you would like to search by: "
    value = gets.chomp.to_s
    contact = Contact.find_by(atrribute,value)
    if contact == nil
      puts "not happening"
    else
      puts contact.inspect
    end

  end

  at_exit do
    ActiveRecord::Base.connection.close
  end

  




end

a_crm_app = CRM.new("mine")
a_crm_app.main_menu
# a_crm_app.print_main_menu
at_exit do
  ActiveRecord::Base.connection.close
end
