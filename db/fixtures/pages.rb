def seed_image filename
  File.new("#{RAILS_ROOT}/db/fixtures/images/#{filename}")
end

Page.seed(:permalink) do |p|
  p.permalink = 'home'
  p.title = 'Home'
  p.is_wrapper = true
  p.tab = seed_image 'home.gif'
  p.hover_tab = seed_image 'home_visited.gif'
  p.content = <<-EOF
  <h1>Welcome to With Imagination</h1>
  <p>So how is With Imagination different you may ask?</p>
  <p>
			With Imagination is a highly regarded company with over 16 years experience in providing a complete range of online business solutions.  
      We specialize in <strong><a href="services.html#design">website design</a></strong> and<strong> <a href="services.html#development">website development</a>, <a href="services.html#ecommerce">e-commerce solutions</a></strong> and <strong><a href="services.html#advertising">online marketing services</a></strong>. <br />
  </p>
  <p>
    Our website design and website development experience ranges from simple brochure based websites to more advanced e-commerce solutions. 
    Check out <strong><a href="<%= projects_path %> ">our projects</a></strong>. In addition, to designing and developing effective websites we also provide a full range of supporting online 
    marketing services including <strong><a href="services.html#seo">search engine optimisation</a></strong> to ensure you achieve a maximum return on your investment. <br />
  </p>
  <p>Would you like to know more about us? Then why not contact us today!</p>
  EOF
end

company_page = Page.seed(:permalink) do |p|
  p.permalink = 'company'
  p.title = 'Company'
  p.tab = seed_image 'company.gif'
  p.hover_tab = seed_image 'company_visited.gif'
  p.content = <<-EOF
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td><h2>With Imagination was incorporated in 1993 with a vision to provide technology based business solutions. 
       We offer a range of online solutions including<strong> <a href="services.html#design">website design</a></strong> & <strong><a href="services.html#development">website development</a>,<a href="services.html#ecommerce">e-commerce solutions</a></strong> and <strong><a href="services.html#advertising">online marketing services</a></strong>.
       <br /><br />
       Our focus is simple, to provide are range of cost effective internet consultancy products and services that add value to our clients business.
       </h2></td>
     </tr>
     <tr>
       <td colspan="2"><h2>Through <a href="services.html"><strong>our services</strong></a> With Imagination has helped many successful small & medium sized companies to fully understand the commercial 
       opportunities of the internet along with maximizing their online investment. <br />
       <br /> 
       Do you have a project in mind? Then why not <a href="contact_us.html">c<strong>ontact us</strong></a> today!      
       </h2></td>
     </tr>
   </table>
  EOF
end

Page.seed(:permalink) do |p|
  p.permalink = 'why_choose_us'
  p.title ='Why Choose Us'
  p.parent = company_page
  p.content = <<-EOF
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
     <tr>
       <td><h2>With Imagination was incorporated in 1993 with a vision to provide technology based business solutions. 
       We offer a range of online solutions including<strong> <a href="services.html#design">website design</a></strong> & <strong><a href="services.html#development">website development</a>,<a href="services.html#ecommerce">e-commerce solutions</a></strong> and <strong><a href="services.html#advertising">online marketing services</a></strong>.
       <br /><br />
       Our focus is simple, to provide are range of cost effective internet consultancy products and services that add value to our clients business.
       </h2></td>
     </tr>
     <tr>
       <td colspan="2"><h2>Through <a href="services.html"><strong>our services</strong></a> With Imagination has helped many successful small & medium sized companies to fully understand the commercial 
       opportunities of the internet along with maximizing their online investment. <br />
       <br /> 
       Do you have a project in mind? Then why not <a href="contact_us.html">c<strong>ontact us</strong></a> today!      
       </h2></td>
     </tr>
   </table>
  EOF
end

Page.seed(:permalink) do |p|
  p.permalink = 'services'
  p.title = 'Services'
  p.tab = seed_image('services.gif')
  p.hover_tab = seed_image('services_visited.gif')
  p.content = <<-EOF
  <h2>Our services are delivered by passionate and highly skilled creative, technical and account management staff that help to plan,
    manage and implement your project successfully.<br />
    <br />
    Our experience and <a href="process.html"><strong>process</strong></a> guarantees quality, competent and timely execution of any projects - from online creative, email campaigns to website 
    solutions. Through our services we translate our knowledge of the internet and online technologies into real value for our customers. 
    We use the best internet technology to drive the best results for your business.<br />
    <br />
    We know that every business is different and will therefore have distinctive technical and business requirements. 
    Therefore as a priority we take special care in understanding your business including your processes and 
    systems in order to deliver the best solution to suit your needs. <br /><br />
    We strive to provide the best service to small & medium enterprises. 
    We also have expertise in providing our services to corporate organisations. See our <a href="<%= projects_path %>"><strong>projects</strong></a>.
    <br />
    <br />
    Every service we offer represents a truly cost effective way of building your business online. </h2>
    <h2><strong>Our services include:</strong></h2> 
    <div id='services'>
    <u><strong><a name="design">Website design</a></strong></u> 
    <div>With Imagination has a highly experienced team of web designers that specialize in web site design. 
    Our team of professional website designers understands what works and will provide you with the best website design options for your business.</div>
    <u><strong><a name="development">Website development</a></strong></u>
    <div>
    At With Imagination, we make it our job to listen, research, and to understand the requirements unique to your business. 
    Our mission is always to provide cost-effective, creative, quality solutions that target your goals ... on-time and within budget. 
    If you’re current website isn’t working for you then we’d also like to hear from you.</div>
  
<u><strong><a name="e-commerce">E-commerce solutions</a></strong></u><div>
    Is building an online store the right thing for your business? 
    At With Imagination we offer a complete range of<strong> e-commerce solutions</strong>. 
    This includes online shopping systems to a wide variety of revenue processing facilities including funds clearance plus supporting 
    services for our customers’ businesses.</div>

   <u><strong><a name="hosting">Website hosting</a></strong></u><div>
    Does your website need secure hosting? With Imagination can provide secure website hosting options to suit your technical and financial resources.</div>

    <u><strong><a name="strategy">Web strategy</a></strong></u><div>
With Imagination can help you to develop a suitable web strategy in line with your business objectives.  
We believe this to be a critical component of any successful business. In order to achieve your maximum ROI, 
   we strongly recommend that a basic website strategy should be in place prior to any projects being actioned.</div>
<u><strong><a name="seo">Search engine marketing</a></strong></u>
<div>
Search Engine marketing is crucial for the success of online business. 
   With Imagination fully understands the technical requirements and marketing benefits in effectively using search engine marketing as part of your online strategy. 
   With Imagination will therefore help you to outline a search engine marketing plan that will bring best results on implementation and will gain you maximum ROI.
</div>
   <u><strong><a name="email">Email marketing campaigns</a></strong></u><div>
Implementing permission based email campaigns is the most cost effective way of developing a consistent way of communicating directly with your customers. 
   Email campaigns can be used for a wide variety of communication needs and if targeted correctly will provide your company with almost immediate positive results.
</div>
  <u><strong><a name="advertising">Online advertising media</a></strong></u><div>
Looking to run an online advertising campaign? Over the years With Imagination has designed many different forms of online advertising media such as buttons, 
   banners and skyscrapers. Running a targeted online advertising campaign can be a very cost effective way of communicating your message to potential customers. 
   With Imagination is also happy to work with your external agencies such as online media planners to ensure the most appropriate and targeted creative is used in 
   conjunction with your campaign objectives.</div>
   <u><strong><a name="promotions">Promotions and competitions</a></strong></u><div>
Are you thinking of running a promotion and/or competition online, at With Imagination we can help you? 
   From promotional concepts to implementation and fulfillment we can help you every step of the way.</div></div>
<h2>Do you require any of our services? Then why not <strong><a href="contact_us.html">contact us</a></strong> today!
    </h2>
  EOF
end

project_page = Page.seed(:permalink) do |p|
  p.title = "Projects"
  p.is_wrapper = true
  p.tab = seed_image 'projects.gif'
  p.hover_tab = seed_image 'projects_visited.gif'
  p.permalink = 'projects'
end

Page.seed(:permalink) do |p|
  p.title = "Contact Us"
  p.is_wrapper = true
  p.tab = seed_image 'contact_us.gif'
  p.hover_tab = seed_image 'contact_visited.gif'
  p.permalink = 'contact_us'
end

Page.seed(:permalink) do |p|
  p.parent = project_page
  p.title = "How We Work"
  p.permalink = 'process'
  p.content = <<-EOF
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
         <td align="center"><img src="/images/portfolio/process/how-we-work.jpg" alt="how we work" /></td>
       </tr>
     </table>
  EOF
end
