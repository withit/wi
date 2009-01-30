class AddFieldsToEnquiries < ActiveRecord::Migration
  def self.up
    add_column :enquiries, :first_name, :string
    add_column :enquiries, :last_name, :string
    add_column :enquiries, :company, :string
    add_column :enquiries, :position, :string
  end

  def self.down
    remove_column :enquiries, :position
    remove_column :enquiries, :company
    remove_column :enquiries, :last_name
    remove_column :enquiries, :first_name
  end
end
