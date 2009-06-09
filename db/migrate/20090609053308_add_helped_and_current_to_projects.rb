class AddHelpedAndCurrentToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :helped, :boolean
    add_column :projects, :current, :boolean
  end

  def self.down
    remove_column :projects, :current
    remove_column :projects, :helped
  end
end
