class AssetsController < ApplicationController
  before_filter :authorize
  
  def new
  end
  
  def index
    @assets = Dir.glob("#{RAILS_ROOT}/public/assets/*")
  end
  
  def create
    FileUtils.mv(params[:uploaded_data].to_tempfile.path, "#{RAILS_ROOT}/public/assets/#{params[:uploaded_data].original_filename}")
    redirect_to :action => 'index'
  end
end