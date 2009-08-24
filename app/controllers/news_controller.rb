class NewsController < ApplicationController
  before_filter :find_months
  before_filter :authorize, :except => [:index, :show]

  WINDOW = (-2..2)

  def index
    respond_to do |format|
      format.html do
        if @current_month_items.first
          redirect_to news_item_by_month_path(:year => @current_month.year,
                                              :month => @current_month.month,
                                              :id => @current_month_items.first)
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
  end

  private

  def find_months
    @first_month = (News.find(:first, :order => "created_at").try(:created_at) || Date.today).to_date.beginning_of_month
    @last_month = (News.find(:last, :order => "created_at").try(:created_at) || Date.today).to_date.beginning_of_month
    @current_month = (params[:year] and params[:month]) ?
      Date.new(params[:year].to_i, params[:month].to_i, 1) :
      Date.today.beginning_of_month
    @current_month_items = News.find(:all, :conditions => ["created_at >= ? and created_at <= ?",
                                                           @current_month,
                                                           @current_month.end_of_month])

    @window = WINDOW.map do |diff|
      @current_month + diff.month
    end.select do |month|
      month >= @first_month and month <= @last_month
    end.reverse
    first = @window.last
    last = @window.first
    @window.push :next if @current_month < @last_month
    @window.unshift :prev if @current_month > @first_month
  end
end
