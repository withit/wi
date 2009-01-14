class NewsController < ApplicationController
  before_filter :authorize, :except => :index
  
  def index
    @news = News.all
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
end
