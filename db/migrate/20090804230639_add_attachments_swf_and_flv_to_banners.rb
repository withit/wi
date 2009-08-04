class AddAttachmentsSwfAndFlvToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :swf_file_name, :string
    add_column :banners, :swf_content_type, :string
    add_column :banners, :swf_file_size, :integer
    add_column :banners, :flv_file_name, :string
    add_column :banners, :flv_content_type, :string
    add_column :banners, :flv_file_size, :integer
  end

  def self.down
    remove_column :banners, :swf_file_name
    remove_column :banners, :swf_content_type
    remove_column :banners, :swf_file_size
    remove_column :banners, :flv_file_name
    remove_column :banners, :flv_content_type
    remove_column :banners, :flv_file_size
  end
end
