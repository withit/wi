class Banner < ActiveRecord::Base
  has_attached_file :flash
  
  has_attached_file :swf, :url => "/swfs/:id/:style/:basename.:extension"
  has_attached_file :flv, :url => "/flvs/:id/:style/:basename.:extension"

  belongs_to :sample_layout
  belongs_to :campaign
  
  def size_id
    sample_layout_id
  end
  
  def size_id= size_id
    self.sample_layout_id = size_id
  end
  
  def height
    sample_layout.banner_height
  end
  
  def width
    sample_layout.banner_width
  end
  
  def campaign_name
    campaign && campaign.name
  end
  
  def campaign_name= campaign_name
    self.campaign = Campaign.find_or_initialize_by_name(campaign_name)
  end
  
  def description
    sample_layout.size + " streaming"
  end
  
  def add_suporting_file= file
    dir = File.dirname(flash.path)
    basename = file.original_filename
    dest = File.join(dir, basename)
    FileUtils.cp(file.path, dest)
  end
end
