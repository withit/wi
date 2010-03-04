class Post < ActiveRecord::Base
  has_many :comments

  has_many :taggings
  has_many :tags, :through => :taggings
  belongs_to :post_image
  default_scope :order => "posts.created_at desc"
  
  
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
    post_image ? post_image.attachment : Image.new(self)
  end
  
  def image= image_file
    build_post_image(:attachment => image_file)
  end
    
  
  class Image < Struct.new(:post)
    def url *args
      "/images/blog/img#{"%02d" % ((post.id % 11) + 1)}.jpg"
    end
  end
end
