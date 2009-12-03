class HomeController < ApplicationController
  before_filter :adjust_format_for_iphone
  
  def index
    @page = Page.find_by_permalink('home') || Page.new
    @projects = Project.find(:all, :conditions => 'slide_file_name is not null', :order => 'position')
  end

end
