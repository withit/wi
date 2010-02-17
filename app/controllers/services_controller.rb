class ServicesController < ApplicationController
  def index
    @page = Page.find_by_permalink('services')
    @services = Service.all
  end

end
