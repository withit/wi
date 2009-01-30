class AddSubscribedToEnquiry < ActiveRecord::Migration
  def self.up
    add_column :enquiries, :subscribed, :boolean
  end

  def self.down
    remove_column :enquiries, :subscribed
  end
end
