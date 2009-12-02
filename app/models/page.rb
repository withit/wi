class Page < ActiveRecord::Base
  has_attached_file :tab
  has_attached_file :hover_tab
  has_attached_file :banner
  has_attached_file :menu_heading
  acts_as_tree
  
  def to_param
    permalink
  end
  
  default_scope :order => 'position'
end
