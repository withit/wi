class Post < ActiveRecord::Base
  has_many :comments

  has_many :taggings
  has_many :tags, :through => :taggings
  
  def tag_names
    @tag_names ||= tags.collect(&:name) * ', '
  end
  
  attr_writer :tag_names
  
  def save_tags
    self.tags = tag_names.split(/,\s+/).collect do |tag_name|
      Tag.find_or_initialize_by_name(tag_name)
    end
  end
  
  def to_param
    "#{id}-#{title.parameterize}"
  end
  
  before_save :save_tags
  
  def image
    Image.new(self)
  end
  
  class Image < Struct.new(:post)
    def url
      "/images/blog/img#{"%02d" % ((post.id % 12) + 1)}.jpg"
    end
  end
end
