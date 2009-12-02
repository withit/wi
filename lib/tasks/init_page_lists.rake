desc "Initialize position for pages"
task :init_page_pos => :environment do
  Page.roots.each_with_index do |page, index|
    page.update_attribute(:position, index + 1)
    page.children.each_with_index do |child, child_index|
      child.update_attribute(:position, child_index + 1)
    end
  end
end