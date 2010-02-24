class AddPostImageIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :post_image_id, :integer
  end

  def self.down
    remove_column :posts, :post_image_id
  end
end
