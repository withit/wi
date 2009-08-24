class CreateNewsLetters < ActiveRecord::Migration
  def self.up
    create_table :news_letters do |t|
      t.string :name
      t.string :keywords
      t.text :description
      
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.datetime :logo_updated_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :news_letters
  end
end
