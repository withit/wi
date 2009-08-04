module PagesHelper
  def unwrapped_page_path page
    if page.permalink == 'projects'
      '/websites'
    else
      page.is_wrapper? ? "/#{page.permalink}" : page_path(page)
    end
  end
  
end
