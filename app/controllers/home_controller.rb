class HomeController < ApplicationController
  before_filter :adjust_format_for_iphone
  
  def index
    @page = Page.find_by_permalink('home') || Page.new
  end

end
