class Page < ActiveRecord::Base
  acts_as_tree
  
  def to_param
    permalink
  end
end
