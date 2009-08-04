class TwitterUser < ActiveResource::Base
  self.site = "http://www.twitter.com/"
  self.element_name = "user"
end
