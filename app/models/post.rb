class Post < ActiveFolder::Base
  def comments
    Comment.all
  end
end