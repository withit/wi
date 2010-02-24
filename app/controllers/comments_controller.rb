class CommentsController < ApplicationController
  before_filter :authorize, :except => :create
  before_filter  :load_tags, :load_comments, :load_post, :protect_from_spam, :only => :create
  
  def create
    @comment = @post.comments.create!(params[:comment])
    
    session[:comment_ids] ||= []
    session[:comment_ids] << @comment.id
    redirect_to @post
  end
  
  def index
    params[:state] ||= 'pending'
    @comments = Comment.find_all_by_state(params[:state])
  end
  
  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes!(params[:comment])
    redirect_to comments_path(:state => params[:state])
  end
  
  protected
  
  def protect_from_spam
    render 'posts/show' unless params[:email].blank?
  end
  
  def load_post
    @post = Post.find(params[:post_id])
  end
end
