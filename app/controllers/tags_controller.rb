class TagsController < ApplicationController
  before_filter :load_comments, :load_tags
  
  def show
    @tag = Tag.find(params[:id])
  end

end
