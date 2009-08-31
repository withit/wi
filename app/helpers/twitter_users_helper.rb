module TwitterUsersHelper
  def latest_tweet
    user = TwitterUser.find('withimagination')
    user.status.text if user.respond_to?(:status)
  rescue
    nil 
  end
  
end
