class Enquiry < ActiveRecord::Base
  attr_accessor :express
  
  def full_name_with_email
    "\"#{full_name}\" <#{email}>"
  end
  
  def full_name
    name || [first_name, last_name] * ' '
  end

  validates_presence_of :name, :email
    
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :allow_blank => true
  
end
