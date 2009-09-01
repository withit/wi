def seed_image filename
  File.new("#{RAILS_ROOT}/db/fixtures/images/#{filename}")
end

matte = Campaign.seed(:name) do |b|
  b.name = "Revlon Matte Collection"
  b.thumbnail = seed_image 'revlon-matte.jpg'
end

gloss = Campaign.seed(:name) do |b|
  b.name = "Revlon Creme Gloss"
  b.thumbnail = seed_image 'creme-gloss.jpg'
end

age_defying = Campaign.seed(:name) do |b|
  b.name = "Revlon Age Deying Spa"
  b.thumbnail = seed_image 'ad-spa-banner.jpg'
end

Banner.seed(:campaign_id, :sample_layout_id) do |b|
  b.campaign_id = matte.id
  b.swf = seed_image("../banners/revlon-matte/300x250/300x250.swf")
  b.flv = seed_image("../banners/revlon-matte/300x250/Revlon Matte 30 sec rev 2 MAR 09.flv") 
  b.sample_layout_id = SampleLayout.find_by_banner_height_and_banner_width(250,300).id
end

Banner.seed(:campaign_id, :sample_layout_id) do |b|
  b.campaign_id = matte.id
  b.swf = seed_image('../banners/revlon-matte/300x600/300x600.swf')
  b.flv = seed_image('../banners/revlon-matte/300x600/Revlon Matte 30 sec rev 2 MAR 09.flv')
  b.sample_layout_id = SampleLayout.find_by_banner_height_and_banner_width(600,300).id
end

Banner.seed(:campaign_id, :sample_layout_id) do |b|
  b.campaign_id = matte.id
  b.swf = seed_image('../banners/revlon-matte/728x90/728x90.swf')
  b.flv = seed_image('../banners/revlon-matte/728x90/Revlon Matte 30 sec rev 2 MAR 09.flv')
  b.sample_layout_id = SampleLayout.find_by_banner_height_and_banner_width(90,728).id
end

Banner.seed(:campaign_id, :sample_layout_id) do |b|
  b.campaign_id = age_defying.id
  b.swf = seed_image('../banners/adspa/300x250-expand/expanding_with_children_parent.swf')
  b.flv = seed_image('../banners/adspa/300x250-expand/Age Defying Spa_Elle_305.flv')
  b.sample_layout_id = SampleLayout.find_by_banner_height_and_banner_width(350,600).id
end

Banner.seed(:campaign_id, :sample_layout_id) do |b|
  b.campaign_id = gloss.id
  b.swf = seed_image('../banners/revlon-creme-gloss/300x250/300x250.swf')
  b.flv =seed_image('../banners/revlon-creme-gloss/300x250/creme_gloss_Tvc_final.flv')
  b.sample_layout_id = SampleLayout.find_by_banner_height_and_banner_width(250,300).id
end

Banner.seed(:campaign_id, :sample_layout_id) do |b|
  b.campaign_id = gloss.id
  b.flash = seed_image('../banners/revlon-creme-gloss/300x600/300x600.swf')
  b.sample_layout_id = SampleLayout.find_by_banner_height_and_banner_width(600,300).id
  b.flv =seed_image('../banners/revlon-creme-gloss/300x600/creme_gloss_Tvc_final.flv')
end
