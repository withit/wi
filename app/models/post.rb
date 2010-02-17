class Post < ActiveRecord::Base
  has_many :comments
  
  def tags
    ["web marketing"]
  end
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
