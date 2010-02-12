class EnquiriesController < ApplicationController
  before_filter :load_page

  def new
    @enquiry = Enquiry.new
  end

  def create
    @enquiry = Enquiry.new(params[:enquiry])

    if @enquiry.save
      redirect_to(@enquiry, :notice => 'Enquiry was successfully created.')
    else
     render :action => "new"
    end
  end
  
  protected
  
  def load_page
    @page = Page.find('contact_us')
  end
end
