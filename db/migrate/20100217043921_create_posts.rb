class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.string :author_name
      t.text :content
      t.integer :tweets_count
      t.integer :comments_count
      t.string :source

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
