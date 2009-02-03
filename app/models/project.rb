class Project < ActiveRecord::Base
  has_attached_file :picture
  has_attached_file :logo
  has_attached_file :slide
  @@per_page = 4
  
end
