class CaseStudiesController < ApplicationController
  def show
    @page = Page.new(:title => 'Case Study')
    @case_study = CaseStudy.all.first
  end

end
