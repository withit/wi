class TagsController < ApplicationController
  before_filter :load_tags
  def show
    @tag = Tag.find(params[:id])
  end

  protected
  
  def load_tags
    @tags = Tag.all
    @comments = Comment.all
  end
end
