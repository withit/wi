# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.wi.com.au"

SitemapGenerator::Sitemap.add_links do |sitemap|
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: sitemap.add path, options
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly', 
  #           :lastmod => Time.now, :host => default_host

  
  # Examples:

  sitemap.add '/', :priority => 1, :changefreq => 'daily'

  sitemap.add '/services', :priority => 0.9, :changefreq => 'weekly'
  sitemap.add '/company', :priority => 0.9, :changefreq => 'weekly'
  sitemap.add '/about', :priority => 0.9, :changefreq => 'weekly'
  sitemap.add '/contact_us', :priority => 0.8, :changefreq => 'weekly'
  sitemap.add '/who_we_helped', :priority => 0.7, :changefreq => 'daily'    
  sitemap.add '/why_choose_us', :priority => 0.7, :changefreq => 'weekly'

  # add '/articles'
  News.find(:all).each do |n|
    sitemap.add news_item_by_month_path(n.by_month_param), :priority => 0.8, :changefreq => 'weekly'
  end

  (1..Project.count(:conditions => {:current => true}) / 4).each do |p|
    sitemap.add projects_path(:page => p), :priority => 0.8, :changefreq => 'weekly'
  end

  sitemap.add news_letters_path, :priority => 0.8, :changefreq => "weekly"

  NewsLetter.find(:all).each do |n|
    sitemap.add news_letter_path(n), :priority => 0.5, :changefreq => "monthly"
  end

  sitemap.add banners_path, :priority => 0.8, :changefreq => "weekly"

  Banner.find(:all).each do |n|
    sitemap.add banner_path(n), :priority => 0.5, :changefreq => "monthly"
  end
  
end
