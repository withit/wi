class News < ActiveRecord::Base
  def to_param
    "%i-%s" % [id, title.parameterize]
  end
end
