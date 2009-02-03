class AddColumnsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :in_footer, :boolean
    add_column :projects, :slide_file_name, :string
    add_column :projects, :slide_content_type, :string
    add_column :projects, :slide_file_size, :integer
  end

  def self.down
    remove_column :projects, :slide_file_size
    remove_column :projects, :slide_content_type
    remove_column :projects, :slide_file_name
    remove_column :projects, :in_footer
  end
end
