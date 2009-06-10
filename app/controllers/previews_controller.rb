class PreviewsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def create
    @preview = RedCloth.new(params[:content]).to_html
    respond_to do |format|
      format.js
    end
  end

end
