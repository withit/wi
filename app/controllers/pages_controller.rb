class PagesController < ApplicationController
  before_filter :authorize, :only => [:edit, :update]

  def show
    @page = Page.find_by_permalink(params[:id])
  end

  def edit
    @page = Page.find_or_create_by_permalink(params[:id])
  end

  def update
    @page = Page.find_or_initialize_by_permalink(params[:id])

    if @page.update_attributes(params[:page])
      flash[:notice] = 'Page was successfully updated.'
      redirect_to(@page)
    else
      render :action => "edit"
    end
  end
  
  def company
    @page = Page.find_by_permalink('company')
  end
  
  def why_choose_us
    @page = Page.find_by_permalink('why_choose_us')
  end
  
  def services
    @page = Page.find_by_permalink('services')
  end
end
