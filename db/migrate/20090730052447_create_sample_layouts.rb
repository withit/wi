class CreateSampleLayouts < ActiveRecord::Migration
  def self.up
    create_table :sample_layouts do |t|
      t.integer :banner_height
      t.integer :banner_width
      t.text :content

      t.timestamps
    end
  end

  def self.down
    drop_table :sample_layouts
  end
end
