class News < ActiveRecord::Base
  def to_param
    "%i-%s" % [id, title.parameterize]
  end

  def by_month_param
    {:month => created_at.month, :year => created_at.year, :id => to_param}
  end
end
