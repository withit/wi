class AssetsController < ApplicationController
  before_filter :authorize
  
  def new
    @asset = Asset.new
  end
  
  def index
    @assets = Asset.all
  end
  
  def create
    @asset = Asset.create(params[:asset])
    redirect_to :action => 'index'
  end
end