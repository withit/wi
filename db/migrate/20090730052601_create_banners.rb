class CreateBanners < ActiveRecord::Migration
  def self.up
    create_table :banners do |t|
      t.integer :campaign_id
      t.integer :sample_layout_id

      t.timestamps
    end
  end

  def self.down
    drop_table :banners
  end
end
