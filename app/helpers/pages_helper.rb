module PagesHelper
  WRAP_MAP = {'projects' => '/websites', 'services' => '/services', 'company' => '/company', 'why_choose_us' => '/why_choose_us'}
  def unwrapped_page_path page
    if WRAP_MAP[page.permalink]
      WRAP_MAP[page.permalink]
    else
      page.is_wrapper? ? "/#{page.permalink}" : page_path(page)
    end
  end
  
end
