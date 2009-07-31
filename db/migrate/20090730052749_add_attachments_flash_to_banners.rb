class AddAttachmentsFlashToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :flash_file_name, :string
    add_column :banners, :flash_content_type, :string
    add_column :banners, :flash_file_size, :integer
  end

  def self.down
    remove_column :banners, :flash_file_name
    remove_column :banners, :flash_content_type
    remove_column :banners, :flash_file_size
  end
end
