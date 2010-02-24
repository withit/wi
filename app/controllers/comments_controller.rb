class CommentsController < ApplicationController
  before_filter  :load_tags, :load_comments, :load_post, :protect_from_spam
  
  def create
    @post.comments.create!(params[:comment])
    redirect_to @post
  end
  
  protected
  
  def protect_from_spam
    render 'posts/show' unless params[:email].blank?
  end
  
  def load_post
    @post = Post.find(params[:post_id])
  end
end
