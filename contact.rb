class Contact
  
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :email
  attr_accessor :id

  @@id = -1
  
  def initialize(name, email)
    @@id += 1
    @id = "0" + @@id.to_s
    @name = name.split(" ")# TODO: assign local variables to instance variables
    @first_name = @name[0].capitalize!
    @last_name = @name[1][0].capitalize!
    @name = @first_name + @last_name
    @email = email
  end
  
  def to_s
    "#{@id}: #{@name} #{@email}"  # TODO: return string representation of Contact
  end

  def create_contact
    @contact = [@id, @name, @email]
  end
  
end