class Project < ActiveRecord::Base
  has_attached_file :image
  has_attached_file :logo
  
end
