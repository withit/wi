class SubscriptionsController < ApplicationController
  
  def create
    @subscription = Subscription.new(params[:subscription])
    if @subscription.save
      redirect_to subscribe_path
    else
      # what do I do here??
    end
  end
end
