class Application
 
  def initialize #public
    # Start with an empty array of contacts.
    # TODO: Perhaps stub (seed) some contacts so we don't have to create some every time we restart the app
    @contacts = []
  end
 
  def run #public
    show_main_menu
    input = gets.chomp
  end

  
  # Prints the main menu only
  def show_main_menu #Should be private -look up!!
    loop do
      puts "Welcome to the app. What's next?".colorize( :color => :light_blue )
      puts " new  - Create a new contact".colorize(:red).on_blue.underline
      puts " list  - List all contacts".colorize(:blue).on_yellow.underline
      puts " show :id - Display contact details"
      puts " quit"
      print "> "

      choice = gets.chomp.downcase.strip
      puts choice
      
      if choice == "new"
        new_contact
      elsif choice == "list"
        list
      elsif choice.include? "show"
        split_val = choice.split(" ")[1]
        if split_val.nil?
          puts "\n\nSorry, you didn't enter an identification\n\n\n"
        else 
          id = split_val.to_i
          show_id(id - 1)
        end
      elsif choice.include? "quit"
        puts "\nGood-bye, have a great day!!\n\n"
        exit
      else
        puts "got here"
      end
    end
  end

  def new_contact
    puts "Please enter your email address"
    email = gets.chomp
    check_email(email) #calls on method to check email
    puts "Please enter your full name"
    name = gets.chomp
    new_contact = Contact.new(name, email)
    @contacts.push(new_contact)
  end

  #method determines if 
  def check_email(email)
    @contacts.each do |x| 
      if x.email == email
        puts "\n\nTHAT EMAIL IS ALREADY REGISTERED!\n\n\n"
        show_main_menu
      end
    end
  end
      
      #something.detect {|contact| contact.email  ==  email} **first instance
      #something.select {|contact| contact.email  ==  email} **all instances

# method to show the contact details
  def show_id id_number
    puts "\n\n #{@contacts[id_number]} \n\n\n"
    puts "Enter 'edit' to edit this contact or 'back' to return to main menu\n\n"
    edit_contact = gets.chomp.strip 
    if edit_contact == "edit"
      puts "If you would like to edit the name enter 'name', if you would like to edit the email, enter 'email'."
      edit_option(id_number)
    elsif edit_contact == "main"
      show_main_menu
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
    puts @contacts[id_number].first_name
    puts "Enter the new first name: "
    new_first_name = gets.chomp.strip
    @contacts[id_number].first_name = new_first_name
    puts "Enter the new last name: "
    new_last_name = gets.chomp.strip
    @contacts[id_number].last_name = new_last_name
    puts "You have successfully changed your contact name to #{@contacts[id_number].first_name} #{@contacts[id_number].last_name}"
  end

  def email_edit(id_number)
    puts "Enter the new email address: "
    new_email_address = gets.chomp.strip
    puts @contacts[id_number].email
    @contacts[id_number].email = new_email_address
    puts "You have sucessfully changed your contact email address to #{@contacts[id_number].email}"
  end

#method to display contact list
  def list
    puts @contacts  
  end
end



