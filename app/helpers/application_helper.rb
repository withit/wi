# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def truncate_preserving_words(text, length = 30, truncate_string = "...")
    return if text.nil?
    l = length - truncate_string.mb_chars.length
    text.mb_chars.length > length ? text[/\A.{#{l}}\w*\;?/m][/.*[\w\;]/m] + truncate_string : text
  end
  
  def twitter_path
    "http://twitter.com/withimagination"
  end
  
  def breadcrumbs_for page, crumbs=[]
    return if page.nil?
    
    crumbs << link_to_unless(crumbs.empty?, breadcrumb_label(page), page)
    parent_crumb = breadcrumb_parent(page)
    breadcrumbs_for(parent_crumb, crumbs) || render_breadcrumbs(crumbs)
  end
  
  def render_breadcrumbs crumbs
    render :partial => 'shared/breadcrumbs', :locals => {:crumbs => crumbs.reverse}
  end
  
  def breadcrumb_parent crumb
    case crumb
    when ActiveRecord::Base
      crumb.class.class_name.pluralize.underscore.to_sym
    when :news_letters, :websites, :banners
      :projects
    when :why_choose_us
      :company
    when :home
      nil
    else
      :home
    end
  end
  
  def breadcrumb_label crumbable
    case crumbable
    when Tag, NewsLetter then crumbable.name
    when Post then crumbable.title
    when Banner then "#{crumbable.description} #{crumbable.campaign_name}"
    else t(crumbable, :scope => 'breadcrumbs')
    end  
  end
  
  def add_this_toolbox post
    @add_this_used ||= true
    <<-EOF
    <div class="addthis_toolbox addthis_default_style">
    <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=xa-4b85df855f79819c" class="addthis_button_compact" addthis:url="#{post_url(post)}" addthis:title="#{post.title}">Share</a>
    </div>
    EOF
  end
  
  def title title
    content_tag(:h1, @page_title = title)
  end
    
end
