class Contact
  
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :email
  attr_accessor :id

  @@id = 0
  
  def initialize(name, email)
    @@id += 1
    @id = "0" + @@id.to_s
    @first_name = name.split(" ")[0]
    @last_name = name.split(" ")[1]
    @email = email
  end
  
  def to_s
    "\n#{@id} #{@first_name} #{@last_name} #{@email}\n"  # TODO: return string representation of Contact
  end

  
  
end