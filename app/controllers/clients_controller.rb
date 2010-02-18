class ClientsController < ApplicationController
  before_filter :load_testimonials
  
  def index
    @clients = Client.all
  end
  
  protected
  
  def load_testimonials
    @testimonials = Testimonial.all
  end
end
