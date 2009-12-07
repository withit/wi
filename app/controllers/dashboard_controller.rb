class DashboardController < ApplicationController
  before_filter :authorize
  
  def index
    @projects = Project.all
  end

end
