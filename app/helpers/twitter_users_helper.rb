module TwitterUsersHelper
  def latest_tweet
    user = TwitterUser.find('monex_rie')
    user.status.text if user.respond_to?(:status) 
  end
  
end
