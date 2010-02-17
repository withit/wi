class Page < ActiveRecord::Base
  has_attached_file :tab
  has_attached_file :hover_tab
  has_attached_file :banner
  has_attached_file :menu_heading
  acts_as_tree
  acts_as_list :scope => :parent_id
  def to_param
    permalink
  end
  
  default_scope :order => 'position'
  
  def remember_parent_ids_to_resync
    @parent_ids_to_resync = parent_id_change
  end
  
  def resync_lists #make sure lists don't get out of wack by changing the parents
    @parent_ids_to_resync.to_a.each do |parent_id|
      Page.find_all_by_parent_id(parent_id).each_with_index do |page, index|
        page.update_attribute(:position, index + 1)
      end
    end
  end  
  
  before_save :remember_parent_ids_to_resync
  after_save :resync_lists
  
  def name
    title
  end
end
