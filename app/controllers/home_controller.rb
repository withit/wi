class HomeController < ApplicationController
  def index
    @page = Page.find_by_permalink('home') || Page.new
  end

end
