class MoveNewsToPosts < ActiveRecord::Migration
  def self.up
    rename_table :posts, :posts_bak
    rename_table :news, :posts
    
    add_column :posts, :author_name, :string
    add_column :posts, :tweets_count, :integer, :default => 0
    add_column :posts, :comments_count, :integer, :default => 0
    add_column :posts, :source, :string
  end

  def self.down
    remove_column :posts, :author_name
    remove_column :posts, :tweets_count
    remove_column :posts, :comments_count
    remove_column :posts, :source
    
    rename_table :posts, :news
    rename_table :posts_bak, :posts
  end
end
