class HomeController < ApplicationController
  before_filter :adjust_format_for_iphone
  
  def index
    @page = Page.find_by_permalink('home') || Page.new
    @projects = Project.all
    @testimonials = Testimonial.all
    @services = Service.all[0..2]
    @post = Post.last
    @case_study = CaseStudy.all[0]
  end

end
