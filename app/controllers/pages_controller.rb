class PagesController < ApplicationController
  before_filter :authorize, :only => [:edit, :update, :index]
  before_filter :adjust_format_for_iphone, :only => :show

  def company
  end
  
  def why_choose_us
  end
  
  def projects
  end
  
  def subscribe
  end
end
