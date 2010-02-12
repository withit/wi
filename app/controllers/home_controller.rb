class HomeController < ApplicationController
  def index
    @services = Service.all
    @testimonials = Testimonial.all
    @page = Page.find(:home)
     @post = Post.all.last
     @case_study = CaseStudy.all.last
     @tweets = Tweet.all
     @projects = Project.all
  end
  
  def websites
    @page = Page.find(:websites)
    @websites = Website.all
  end
end
