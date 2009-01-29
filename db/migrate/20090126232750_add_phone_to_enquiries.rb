class AddPhoneToEnquiries < ActiveRecord::Migration
  def self.up
    add_column :enquiries, :phone, :string
  end

  def self.down
    remove_column :enquiries, :phone
  end
end
