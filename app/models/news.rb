class News < ActiveRecord::Base
  def to_param
    "%i-%s" % [id, title.parameterize]
  end

  def by_month_param
    {:month => created_at.month, :year => created_at.year, :id => to_param}
  end
  
  class Month
    attr_reader :year, :month
    
    def self.first
      time = News.minimum(:created_at) || Time.now
      new(time.year, time.month)
    end
    
    def self.last
      time = News.maximum(:created_at) || Time.now
      new(time.year, time.month)
    end
    
    def self.all
    end
    
    def news_items
      News.find(:all, :conditions => {:created_at => beginning_of_month..end_of_month})
    end
    
    def initialize year, month
      @month = (month || Date.today.month).to_i
      @year = (year || Date.today.year).to_i
    end
    
    def to_date
      Date.new(@year, @month, 1)
    end
    
    def succ
      date = to_date >> 1
      Month.new(date.year, date.month)
    end
    
    def prev
      date = to_date << 1
      Month.new(date.year, date.month)
    end
    
    # returns all months within size of this month
    def window size
      start_date = [to_date << size, Month.first.to_date].max
      end_date = [to_date >> size, Month.last.to_date].min
      start_month = Month.new(start_date.year, start_date.month)
      end_month = Month.new(end_date.year, end_date.month)
      
      (start_month..end_month).to_a.reverse
    end
    
    def <=> other
      to_date <=> other.to_date
    end
    
    def beginning_of_month
      to_date.beginning_of_month
    end
    
    def end_of_month
      to_date.end_of_month
    end
    
    def last?
      self == self.class.last
    end
    
    def first?
      self == self.class.first
    end
    
    def == other
      @month == other.month && @year == other.year
    end
  end
end
