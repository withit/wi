# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'bba6ef3ec6d8ccd5165aa2523b6c5334'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  protected 
  
  def admin?
    session[:admin]
  end
  
  helper_method :admin?
  
  def authorize
    unless admin?
      redirect_to home_path 
      flash[:notice] = t('flash.not_authorised')
    end
  end
  
  # Set iPhone format if request to i subdomain
  def adjust_format_for_iphone
    request.format = :iphone if iphone_request?
  end

  # Return true for requests to i subdomain
  def iphone_request?
    return (request.subdomains.first == "i" || params[:format] == "iphone")
  end
  
  def redirect_to_iphone
    redirect_to :subdomain => 'i' if iphone_user_agent? && request.subdomains.first != 'i'
  end
  
  def iphone_user_agent?
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
  end
  
  helper_method :iphone_user_agent?

  
  before_filter :redirect_to_iphone
  
  before_filter :load_testimonials
  
  def load_testimonials
    @testimonials = Testimonial.all
  end
end
