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
  
  def authorize
    unless admin?
      redirect_to home_path 
      flash[:notice] = t('flash.not_authorised')
    end
  end
end
