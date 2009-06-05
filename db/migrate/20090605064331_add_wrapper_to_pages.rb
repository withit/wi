class AddWrapperToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :is_wrapper, :boolean
  end

  def self.down
    remove_column :pages, :is_wrapper
  end
end
