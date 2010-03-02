class NewsController < ApplicationController
  before_filter :load_all_news
  before_filter :authorize, :except => [:index, :show]
  # before_filter :adjust_format_for_iphone, :only => :show

  WINDOW = (-3..3)

  def index
  end

  def new
    @news = News.new
  end

  def create
    @news = News.create!(params[:news])
    redirect_to news_path
  end

  def edit
    @news = News.find(params[:id])
  end

  def update
    @news = News.find(params[:id])
    @news.update_attributes!(params[:news])
    redirect_to news_path
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    redirect_to news_path
  end

  def show
    @news = News.find(params[:id])
    respond_to do |format|
      format.html
      format.iphone{ render :layout => 'application'}
    end
  end

  private

  def load_all_news
    @all_news = News.all(:order => 'created_at desc')
  end
end
