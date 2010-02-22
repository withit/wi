class EnquiriesController < ApplicationController
  before_filter :load_page
  before_filter :adjust_format_for_iphone
  def new
    @enquiry = Enquiry.new
  end
  
  def create
    @enquiry = Enquiry.new(params[:enquiry])
    if @enquiry.save
      redirect_to contact_us_path
      flash[:notice] = "Thank you for your enquiry. We will be in touch shortly."
      Notifier.deliver_enquiry @enquiry
      Notifier.deliver_confirmation @enquiry
    else
      render :action => 'new'
    end
  end
  
  def show
    @enquiry = Enquiry.find(session[:enquiry_id])
    session[:enquiry_id] = nil
  rescue
    redirect_to contact_us_path
  end
  
  protected
  
  def load_page 
    @page = Page.find_by_permalink("contact_us")
  end
end
