class NewsController < ApplicationController
  before_filter :find_months
  before_filter :authorize, :except => [:index, :show]
  before_filter :adjust_format_for_iphone, :only => :show

  WINDOW = (-3..3)

  def index
    respond_to do |format|
      format.html do
        if @month.news_items.first
          redirect_to news_item_by_month_path(:year => @month.year,
                                              :month => @month.month,
                                              :id => @month.news_items.first)
        else
          @current_month_items = []
        end
      end
      format.rss
    end

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

  def find_months
    @month = News::Month.new(params[:year], params[:month])
    @months = @month.window(3)
  end
end
