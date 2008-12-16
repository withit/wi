class Enquiry < ActiveRecord::Base
  def name_with_email
    "\"#{name}\" <#{email}>"
  end
end
