class AddAttachmentsAttachmentToPostImages < ActiveRecord::Migration
  def self.up
    add_column :post_images, :attachment_file_name, :string
    add_column :post_images, :attachment_content_type, :string
    add_column :post_images, :attachment_file_size, :integer
    add_column :post_images, :attachment_updated_at, :datetime
  end

  def self.down
    remove_column :post_images, :attachment_file_name
    remove_column :post_images, :attachment_content_type
    remove_column :post_images, :attachment_file_size
    remove_column :post_images, :attachment_updated_at
  end
end
