class PostsController < ApplicationController
  before_filter :load_page, :load_comments, :load_tags
  
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to(@post)
    else
      render :action => "new"
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to(@post) 
    else
      render :action => "edit" 
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to(posts_url)
  end
  
  protected
  
  def load_page
    @page = Page.find(:blogs)
  end
  
  def load_comments
    @comments = Comment.all
  end
  
  def load_tags
    @tags = Tag.all
  end
end
