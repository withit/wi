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
      new(News.minimum(:created_at) || Time.now)
    end
    
    def self.last
      new(News.maximum(:created_at) || Time.now)
    end
    
    def news_items
      News.find(:all, :conditions => {:created_at => beginning_of_month..end_of_month})
    end
    
    def initialize year_or_date, month=nil
      if year_or_date.respond_to?(:year) && year_or_date.respond_to?(:month)
        @month = year_or_date.month
        @year = year_or_date.year
      else
        @month = (month || Date.today.month).to_i
        @year = (year_or_date || Date.today.year).to_i
      end
    end
    
    def to_date
      Date.new(@year, @month, 1)
    end
    
    def succ
      Month.new(to_date >> 1)
    end
    
    def prev
      Month.new(to_date << 1)
    end
    
    # returns all months within size of this month
    def window size
      start_date = [to_date << size, Month.first.to_date].max
      end_date = [to_date >> size, Month.last.to_date].min
      
      (Month.new(start_date)..Month.new(end_date)).to_a.reverse
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
