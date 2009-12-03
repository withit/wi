class JavascriptsController < ApplicationController
  def twitter
    begin
      user = TwitterUser.find('withimagination')
      @latest_tweet = user.status.text if user.respond_to?(:status)
    rescue
      @latest_tweet = nil
    end
    respond_to do |format|
      format.js
    end
  end
end
