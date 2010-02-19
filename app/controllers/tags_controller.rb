class TagsController < ApplicationController
  def show
    @tag = Tag.find_or_initialize_by_name(params[:id])
  end

end
