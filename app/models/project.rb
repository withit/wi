class Project < ActiveRecord::Base
  has_attached_file :picture
  has_attached_file :logo
  
end
