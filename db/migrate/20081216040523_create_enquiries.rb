class CreateEnquiries < ActiveRecord::Migration
  def self.up
    create_table :enquiries do |t|
      t.string :name
      t.text :message
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :enquiries
  end
end
