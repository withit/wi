class EnquiriesController < ApplicationController
  def new
    @enquiry = Enquiry.new
  end
  
  def create
    @enquiry = Enquiry.create!(params[:enquiry])
    redirect_to enquiry_path
    session[:enquiry_id] = @enquiry.id
    Notifier.deliver_enquiry @enquiry
  end
  
  def show
    @enquiry = Enquiry.find(session[:enquiry_id])
    session[:enquiry_id] = nil
  rescue
    redirect_to contact_us_path
  end
end
