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
  
  def company
    @page = Page.find(:company)
    @testimonials = Testimonial.all
  end
  
  def why_choose_us
    @page = Page.find(:why_choose_us)
    @testimonials = Testimonial.all
  end
  
  def clients
    @page = Page.find(:clients)
    @testimonials = Testimonial.all
  end
  
  def blogs
    @page = Page.find(:blogs)
    @posts = Post.all[0..5]
    @tweets = Tweet.all
    @comments = Comment.all
  end
  
  def case_study
    @page = Page.find(:case_study)
    @case_study = CaseStudy.all.last
  end
  
  def post
    @post = Post.all[0]
    @page = Page.find(:blogs)
    @tweets = Tweet.all
    @comments = Comment.all
  end
  
  def services
    @page = Page.find(:services)
    @services = Service.all[3..-1]
  end
end
