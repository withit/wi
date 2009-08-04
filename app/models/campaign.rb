class Campaign < ActiveRecord::Base
  has_attached_file :thumbnail
  has_many :banners
end
