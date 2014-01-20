class Application
 
  def initialize
    # Start with an empty array of contacts.
    # TODO: Perhaps stub (seed) some contacts so we don't have to create some every time we restart the app
    @contacts = []
  end
 
  def run
    show_main_menu
    input = gets.chomp
  end
  
  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the app. What's next?"
    puts " new  - Create a new contact"
    puts " list  - List all contacts"
    puts " show :id - Display contact details"
    print "> "

    choice = gets.chomp.downcase

    case choice
      when "new"
        new_contact()
      when "list"
        contact_list() #puts contact list
      when "show : id "
        show_contact()
    end
  end

# method creates a new contact

  def new_contact
    puts "Please enter your full name"
    name = gets.chomp
    puts "Please enter your email address"
    email = gets.chomp
    new_contact = Contact.new(name, email)
    add_contact(name, email)
  end

# method to add contact to array

  def add_contact(name, email)
    


  end

# method to show the contact details
  def show_contact

  end

#method to display contact list
  def contact_list

  end


end