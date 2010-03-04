class DashboardController < ApplicationController
  before_filter :authorize
  
  def index
    @posts = Post.all
  end

end
