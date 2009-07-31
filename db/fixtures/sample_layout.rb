Dir.glob("#{RAILS_ROOT}/db/fixtures/sample_layouts/*.html").each do |template|
  width, height = File.basename(template, ".html").split('x')
  
  SampleLayout.seed(:banner_height, :banner_width) do |layout|
    layout.content = File.read(template)
    layout.banner_width = width.to_i
    layout.banner_height = height.to_i
  end
end