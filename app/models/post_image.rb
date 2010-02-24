class PostImage < ActiveRecord::Base
  has_attached_file :attachment, :styles => {:original => '647x176!', :thumb => '295x80!'}
  
  def self.create_from_folder
    Dir.glob("#{Rails.root}/public/images/blog/*.jpg").each do |path|
      create!(:attachment => File.new(path))
    end
  end
end
