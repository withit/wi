class SampleLayout < ActiveRecord::Base
  # Layout for displaying banner files on dummy pages
  # Div with id banner gets replaced with the banner file
  def size
    [banner_width, banner_height] * "x"
  end

  def expandable?
    banner_width == 600 and banner_height == 350
  end
end
