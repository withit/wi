class Status
  # self.site = "http://twitter.com/"
  # self.element_name = "user"
  
  require 'net/http'
  
  def self.create
    uri = URI.parse('http://withimagination:password@twitter.com/statuses/update.xml')
    Net::HTTP.post_form(uri,{:status => "Why do people use twitter?"})
  end
  
end