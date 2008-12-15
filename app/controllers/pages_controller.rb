class PagesController < ApplicationController
  before_filter :authorize, :except => [:show]

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
end
