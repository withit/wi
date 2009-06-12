def seed_image filename
  File.new("#{RAILS_ROOT}/db/fixtures/images/#{filename}")
end

Page.seed(:permalink) do |p|
  p.permalink = 'home'
  p.title = 'Home'
  p.is_wrapper = true
  p.tab = seed_image 'home.jpg'
  p.hover_tab = seed_image 'home_hover.jpg'
  p.content = <<-EOF
h1. Welcome to With Imagination

So how is With Imagination different you may ask?

With Imagination is a highly regarded company with over 16 years experience in providing a complete range of online business solutions.  We specialize in "website design":services.html#design and "website development":services.html#development, "e-commerce solutions":services.html#ecommerce and "online marketing services":services.html#advertising". 

Our website design and website development experience ranges from simple brochure based websites to more advanced e-commerce solutions. Check out "our projects":/projects. In addition, to designing and developing effective websites we also provide a full range of supporting online marketing services including "search engine optimisation":services.html#seo to ensure you achieve a maximum return on your investment. 

Would you like to know more about us? Then why not contact us today!
EOF
end

company_page = Page.seed(:permalink) do |p|
  p.permalink = 'company'
  p.title = 'Company'
  p.tab = seed_image 'company.jpg'
  p.hover_tab = seed_image 'company_hover.jpg'
  p.content = <<-EOF
With Imagination was incorporated in 1993 with a vision to provide technology based business solutions. We offer a range of online solutions including "website design":services.html#design & "website development":services.html#development,"e-commerce solutions":services.html#ecommerce and "online marketing services":services.html#advertising.

Our focus is simple, to provide are range of cost effective internet consultancy products and services that add value to our clients business.

Through "our services":services.html With Imagination has helped many successful small & medium sized companies to fully understand the commercial opportunities of the internet along with maximizing their online investment. 
 
Do you have a project in mind? Then why not "contact us":contact_us.html today!      
  EOF
end

Page.seed(:permalink) do |p|
  p.permalink = 'why_choose_us'
  p.title ='Why Choose Us'
  p.parent = company_page
  p.content = <<-EOF
*We are passionate about helping businesses to grow online by:*

* Delivering a quality product at a realistic price
* Offering high levels of customer service
* Using tested procedures to deliver projects on time
* Knowledgeable and experienced in the design & development of websites
* Providing additional online marketing services to maximize your investment
* Being a trusted partner to small & medium enterprises and corporations
* Always flexible and easy to do business with
  
  EOF
end

Page.seed(:permalink) do |p|
  p.permalink = 'services'
  p.title = 'Services'
  p.tab = seed_image('services.jpg')
  p.hover_tab = seed_image('services_hover.jpg')
  p.content = <<-EOF
Our services are delivered by passionate and highly skilled creative, technical and account management staff that help to plan, manage and implement your project successfully.

Our experience and "process":process.html guarantees quality, competent and timely execution of any projects - from online creative, email campaigns to website solutions. Through our services we translate our knowledge of the internet and online technologies into real value for our customers. We use the best internet technology to drive the best results for your business.

We know that every business is different and will therefore have distinctive technical and business requirements. Therefore as a priority we take special care in understanding your business including your processes and systems in order to deliver the best solution to suit your needs.

We strive to provide the best service to small & medium enterprises. We also have expertise in providing our services to corporate organisations. See our "projects":/projects.

Every service we offer represents a truly cost effective way of building your business online.

*Our services include:* 

h3. <a name="design">Website design</a>

With Imagination has a highly experienced team of web designers that specialize in web site design. Our team of professional website designers understands what works and will provide you with the best website design options for your business.

h3. <a name="development">Website development</a>

At With Imagination, we make it our job to listen, research, and to understand the requirements unique to your business. Our mission is always to provide cost-effective, creative, quality solutions that target your goals ... on-time and within budget. If you’re current website isn’t working for you then we’d also like to hear from you.
  
h3. <a name="e-commerce">E-commerce solutions</a>

Is building an online store the right thing for your business? At With Imagination we offer a complete range of *e-commerce solutions*. This includes online shopping systems to a wide variety of revenue processing facilities including funds clearance plus supporting services for our customers’ businesses.

h3. <a name="hosting">Website hosting</a>

Does your website need secure hosting? With Imagination can provide secure website hosting options to suit your technical and financial resources.

h3. <a name="strategy">Web strategy</a>

With Imagination can help you to develop a suitable web strategy in line with your business objectives. We believe this to be a critical component of any successful business. In order to achieve your maximum ROI, we strongly recommend that a basic website strategy should be in place prior to any projects being actioned.

h3. <a name="seo">Search engine marketing</a>

Search Engine marketing is crucial for the success of online business. With Imagination fully understands the technical requirements and marketing benefits in effectively using search engine marketing as part of your online strategy. With Imagination will therefore help you to outline a search engine marketing plan that will bring best results on implementation and will gain you maximum ROI.

h3. <a name="email">Email marketing campaigns</a>

Implementing permission based email campaigns is the most cost effective way of developing a consistent way of communicating directly with your customers. Email campaigns can be used for a wide variety of communication needs and if targeted correctly will provide your company with almost immediate positive results.

h3. <a name="advertising">Online advertising media</a>

Looking to run an online advertising campaign? Over the years With Imagination has designed many different forms of online advertising media such as buttons, banners and skyscrapers. Running a targeted online advertising campaign can be a very cost effective way of communicating your message to potential customers. With Imagination is also happy to work with your external agencies such as online media planners to ensure the most appropriate and targeted creative is used in conjunction with your campaign objectives.

h3. <a name="promotions">Promotions and competitions</a>

Are you thinking of running a promotion and/or competition online, at With Imagination we can help you? From promotional concepts to implementation and fulfillment we can help you every step of the way.

Do you require any of our services? Then why not "contact us":/contact_us.html today!

EOF
end

project_page = Page.seed(:permalink) do |p|
  p.title = "Projects"
  p.is_wrapper = false
  p.tab = seed_image 'projects.jpg'
  p.hover_tab = seed_image 'projects_hover.jpg'
  p.permalink = 'projects'
end

Page.seed(:permalink) do |p|
  p.title = "Contact Us"
  p.is_wrapper = true
  p.tab = seed_image 'contact_us.jpg'
  p.hover_tab = seed_image 'contact_us_hover.jpg'
  p.permalink = 'contact_us'
end

Page.seed(:permalink) do |p|
  p.parent = company_page
  p.title = "How We Work"
  p.permalink = 'process'
  p.content = <<-EOF
  !/images/portfolio/process/how-we-work.jpg(how we work)!
  EOF
end

Page.seed(:permalink) do |p|
  p.title = "Who We Helped"
  p.parent = company_page
  # p.is_wrapper = true
  p.tab = seed_image 'projects.jpg'
  p.hover_tab = seed_image 'projects_hover.jpg'
  p.permalink = 'who_we_helped'
end

Page.seed(:permalink) do |p|
  p.title = "Websites"
  p.parent = project_page
  p.is_wrapper = true
  p.permalink = 'websites'
end

Page.seed(:permalink) do |p|
  p.title = "Banners"
  p.parent = project_page
  # p.is_wrapper = true
  p.permalink = 'banners'
end

Page.seed(:permalink) do |p|
  p.title = "Newsletters"
  p.parent = project_page
  # p.is_wrapper = true
  p.permalink = 'newsletters'
end
