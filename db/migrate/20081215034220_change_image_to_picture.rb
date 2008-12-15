class ChangeImageToPicture < ActiveRecord::Migration
  def self.up
    rename_column :projects, :image_file_name, :picture_file_name
    rename_column :projects, :image_content_type, :picture_content_type
    rename_column :projects, :image_file_size, :picture_file_size
    rename_column :projects, :image_updated_at, :picture_updated_at
  end

  def self.down
    rename_column :projects, :picture_file_name, :image_file_name
    rename_column :projects, :picture_content_type, :image_content_type
    rename_column :projects, :picture_file_size, :image_file_size
    rename_column :projects, :picture_updated_at, :image_updated_at
  end
end
