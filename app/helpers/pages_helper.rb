module PagesHelper
  def unwrapped_page_path page
    page.is_wrapper? ? "/#{page.permalink}" : page_path(page)
  end
  
end
