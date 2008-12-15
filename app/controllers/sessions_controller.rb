class SessionsController < ApplicationController
  def new
  end
  
  def create
    if params[:password] == 'twisties'
      session[:admin] = true
      redirect_to home_path
    else
      render :action => 'new'
      flash[:notice] = 'Invalid Password'
    end
  end
  
  def destroy
    session[:admin] = false
    redirect_to home_path
  end
end
