class Application
 
  def initialize #public
    # Start with an empty array of contacts.
    # TODO: Perhaps stub (seed) some contacts so we don't have to create some every time we restart the app
    
  end
 
  def run #public
    show_main_menu
    #input = gets.chomp
  end

  
  # Prints the main menu only
  def show_main_menu #Should be private -look up!!
    loop do
      puts "Welcome to the app. What's next?".colorize( :color => :light_blue )
      puts " new  - Create a new contact".colorize(:red).on_blue.underline
      puts " list  - List all contacts".colorize(:blue).on_yellow.underline
      puts " show :id - Display contact details"
      puts " find"
      puts " delete :id"
      puts " vip - List your contacts by importance"
      puts " quit "
      print "> "

      choice = gets.chomp.downcase.strip.downcase
      puts choice
      
      if choice == "new" #choice for new contact
        new_contact
      elsif choice == "list"
        list
      elsif choice == "find"
        find
      elsif choice.include? "delete" #choice for deletion
                split_delete = choice.split(" ")[1]
        if split_delete.nil?
          puts "\n\nSorry, you haven't selected an id for deletion"
        else
          id = split_delete.to_i
          delete(id)
        end
      elsif choice.include? "show" #choice for showing contact by id
        split_show = choice.split(" ")[1]
        if split_show.nil?
          puts "\n\nSorry, you didn't enter an identification\n\n\n"
        else 
          id = split_show.to_i
          show_id(id)
        end
      elsif choice == "vip"  #choice to list by importance call
        list_most_important
  
      elsif choice.include? "quit" #choice to quit
        puts "\nGood-bye, have a great day!!\n\n"
        exit
      
      else
        puts "got here"
        exit
      end
    end
  end
  
  def new_contact
    puts "Please enter your email address"
    email = gets.chomp.strip.downcase
    check_email(email) #calls on method to check email
    puts "Please enter your first name"
    first_name = gets.chomp.strip.downcase
    puts "Please enter your last name"
    last_name = gets.chomp.strip.downcase
    puts "Enter a number from 1-5 to prioritize this contact"
    priority = gets.chomp.strip
    new_contact = Contact.create(first_name: first_name, last_name: last_name, email: email, importance: priority)
  end

  #method determines if 
  def check_email(email)
    Contact.all.each do |x| 
      if x.email == email
        puts "\n\nTHAT EMAIL IS ALREADY REGISTERED!\n\n\n"
        show_main_menu
      end
    end
  end

  def find
    puts "Would you like to search for 'first name', 'last name', or 'email'"
    search_type = gets.chomp.strip
    search(search_type)
  end

  def search(search_type)
    if search_type == "first name"
      find_first_name
    elsif search_type == "last name"
      find_last_name
    elsif search_type == "email"
      find_email
    end
  end

  def find_first_name
    puts "What is the first name you are looking for?\n"
    first_name = gets.chomp.strip.downcase
    first_name_found = Contact.find_by_first_name(first_name)
    puts first_name_found
  end

  def find_last_name
    puts "What is the last name you are looking for?\n"
    last_name = gets.chomp.strip.downcase
    last_name_found = Contact.find_by_last_name(last_name)
    puts last_name_found
  end

  def find_email
    puts "What is the email address you are looking for?\n"
    email = gets.chomp.strip.downcase
    email_found = Contact.find_by_email(email)
    puts email_found
  end
      
      #something.detect {|contact| contact.email  ==  email} **first instance
      #something.select {|contact| contact.email  ==  email} **all instances

# method to show the contact details
  def show_id id
    puts "\nYou have searched for id #{id}\n"
    contact = Contact.find(id)
    #this could also work for multifield searches
   # contact = Contact.find_by(id: id) or Contact.find_by_id(id)
   # contact = Contact.find_by(first_name: first_name)
   # contact = Contact.find_by(last_name: last_name)
   # contact = Contact.find_by(email: email)
    puts "\nid-number: #{contact.id} name: #{contact.first_name} #{contact.last_name}, contact-email: #{contact.email}\n\n"
    
    puts "Enter 'edit' to edit this contact or 'back' to return to main menu\n\n"
    edit_contact = gets.chomp.strip.downcase
    if edit_contact == "edit"
      puts "If you would like to edit the name enter 'name', if you would like to edit the email, enter 'email'."
      edit_option(id)
    elsif edit_contact == "main"
      show_main_menu
    end
  end

  def delete id
    puts "Are you sure you want to delete #{id}?\n"
    puts "Enter 'yes' to confirm deletion"
    delete_confirm = gets.chomp.strip.downcase
    if delete_confirm == "yes"
      delete_user = Contact.find_by(id: id)
      delete_user.destroy
      puts "\nUser #{id} has been deleted from the database.\n"
    end
  end

  def list_most_important
    if Contact 
    vip = Contact.order('importance DESC' )
    puts vip
    end
  end


  def edit_option(id_number)
    edit_choice = gets.chomp.strip
    if edit_choice == "name"
      name_edit(id_number)
    elsif edit_choice == "email"
      email_edit( id_number)
    end 
  end

  def name_edit(id_number)
    puts Contact[id_number].first_name
    puts "Enter the new first name: "
    new_first_name = gets.chomp.strip
    Contact[id_number].first_name = new_first_name
    puts "Enter the new last name: "
    new_last_name = gets.chomp.strip
    Contact[id_number].last_name = new_last_name
    puts "You have successfully changed your contact name to #{Contact[id_number].first_name} #{Contact[id_number].last_name}"
  end

  def email_edit(id_number)
    puts "Enter the new email address: "
    new_email_address = gets.chomp.strip
    puts Contact[id_number].email
    Contact[id_number].email = new_email_address
    puts "You have sucessfully changed your contact email address to #{Contact[id_number].email}"
  end

#method to display contact list
  def list 
    puts "Listing contacts"
    Contact.all.each do |contact|
      puts "test 1"
      puts contact
      puts "test 2"
    end
    puts "Done"
  end
end



