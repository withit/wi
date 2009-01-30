class AddTitleToEnquiry < ActiveRecord::Migration
  def self.up
    add_column :enquiries, :title, :string
  end

  def self.down
    remove_column :enquiries, :title
  end
end
