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
      puts "Welcome to the app. What's next?"
      puts " new  - Create a new contact"
      puts " list  - List all contacts"
      puts " show :id - Display contact details"
      puts " quit"
      print "> "

      choice = gets.chomp.downcase.strip
      
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
      elsif choice.inlcude? "quit"
        exit
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
    #show_main_menu
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

# method to show the contact details
 

  def show_id id_number
    puts "\n\n #{@contacts[id_number]} \n\n\n"
    # show_main_menu
  end

#method to display contact list
  def list
    puts @contacts
    #show_main_menu
  end
end