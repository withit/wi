class EnquiriesController < ApplicationController
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
end
