class CaseStudiesController < ApplicationController
  def show
    @page = Page.find(:case_study)
    @case_study = CaseStudy.all.first
  end

end
