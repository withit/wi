class EnquiriesController < ApplicationController
  before_filter :load_page
  before_filter :adjust_format_for_iphone
  def new
    @enquiry = Enquiry.new
  end
  
  def create
    @enquiry = Enquiry.new(params[:enquiry])
    @enquiry.save!
    redirect_to enquiry_path
    session[:enquiry_id] = @enquiry.id
    Notifier.deliver_enquiry @enquiry
    Notifier.deliver_confirmation @enquiry
  rescue ActiveRecord::RecordInvalid
    if @enquiry.express
      @body_class = 'home'
      @page = Page.find_by_permalink('home') || Page.new
      render :file => 'home/index', :layout => true
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
