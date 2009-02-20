class Project < ActiveRecord::Base
  has_attached_file :picture
  has_attached_file :logo
  has_attached_file :slide
  @@per_page = 4
  
  acts_as_list
  
  def sort_order= position
    insert_at(position)
  end
  
  def sort_order
    position
  end
end
