class NewsLetter < ActiveRecord::Base
  has_attached_file :logo
  has_attached_file :image
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
end
