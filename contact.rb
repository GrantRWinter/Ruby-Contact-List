class Contact < ActiveRecord::Base
   
  def to_s
    "\nINTERNAL ID: #{id}  FULL NAME: #{first_name} #{last_name} EMAIL: #{email} PRIORITY: #{importance}\n"  # TODO: return string representation of Contact
  end 
end