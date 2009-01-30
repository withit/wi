class Enquiry < ActiveRecord::Base
  attr_accessor :express
  
  def full_name_with_email
    "\"#{full_name}\" <#{email}>"
  end
  
  def full_name
    name || [title, first_name, last_name] * ' '
  end
  
  validates_confirmation_of :email
  validates_presence_of :first_name, :last_name, :email, :unless => :express
  validates_presence_of :name, :email, :phone, :if => :express
end
