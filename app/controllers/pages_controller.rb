class PagesController < ApplicationController
  before_filter :authorize, :only => [:edit, :update, :index]

  def show
    @page = Page.find_by_permalink(params[:id])
  end

  def edit
    @page = Page.find_or_create_by_permalink(params[:id])
    @assets = Asset.all
  end

  def update
    @page = Page.find_or_initialize_by_permalink(params[:id])

    if @page.update_attributes(params[:page])
      flash[:notice] = 'Page was successfully updated.'
      redirect_to(@page)
    else
      @assets = Asset.all
      render :action => "edit"
    end
  end
  
  def company
    @page = Page.find_by_permalink('company')
    render :action => 'show'
  end
  
  def why_choose_us
    @page = Page.find_by_permalink('why_choose_us')
    render :action => 'show'
  end
  
  def services
    @page = Page.find_by_permalink('services')
    render :action => 'show'
  end
  
  def processes
    @page = Page.find_by_permalink('process')
    render :action => 'show'
  end
  
  def index
    @root_pages = Page.roots
  end
  
  def new
    @assets = Asset.all
    @page = Page.new
  end
end
