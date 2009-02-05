class SessionsController < ApplicationController
  def new
  end
  
  def create
    if params[:password] == 'imagination'
      session[:admin] = true
      redirect_to dashboard_path
    else
      render :action => 'new'
      flash[:notice] = t('flash.invalid_password')
    end
  end
  
  def destroy
    session[:admin] = false
    redirect_to home_path
  end
end
