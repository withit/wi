class AddInSlideShowToProjects < ActiveRecord::Migration
  class Project < ActiveRecord::Base
  end
  
  def self.up
    add_column :projects, :in_slideshow, :boolean
    
    Project.update_all({:in_slideshow => true}, 'slide_file_name is not null')
  end

  def self.down
    remove_column :projects, :in_slideshow
  end
end
