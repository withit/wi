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
    
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i
  
  def self.build_express
    new(:name => 'name', :email => 'email address', :phone => 'phone', :express => true)
  end
  
  
end
