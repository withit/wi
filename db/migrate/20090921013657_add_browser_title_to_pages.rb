class AddBrowserTitleToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :browser_title, :string
  end

  def self.down
    remove_column :pages, :browser_title
  end
end
