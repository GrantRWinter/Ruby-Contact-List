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
        list() #puts contact list 
      when "show:"
        show_contact() # will print contact details by id reference
    end
  end

# method creates a new contact
# **add while loop**

  def new_contact
    puts "Please enter your full name"
    name = gets.chomp
    puts "Please enter your email address"
    email = gets.chomp
    new_contact = Contact.new(name, email)
    puts new_contact
    @contacts.push(new_contact)
    puts @contacts
    show_main_menu
  end

  

# method to show the contact details
  def show_contact
    puts "Which ID would you like to see?"
    id_number = gets.chomp.to_i
    puts @contacts[id_number]
    show_main_menu


  end

#method to display contact list
  def list
    puts @contacts
    show_main_menu
  end
end