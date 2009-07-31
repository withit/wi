class BannersController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  def new
    @banner = Banner.new
  end
  
  def create
    @banner = Banner.new(params[:banner])
    if @banner.save
      redirect_to :action => 'new'
    else
      render :new
    end
  end
  
  def edit
    @banner = Banner.find(params[:id])
  end
  
  def update
    @banner = Banner.find(params[:id])
    if @banner.update_attributes(params[:banner])
      redirect_to :action => 'new'
    else
      render :edit
    end
  end
  
  def show
    @banner = Banner.find(params[:id])
  end
  
  def index
    @campaigns = Campaign.all
  end
end
