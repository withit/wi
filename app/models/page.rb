class Page < ActiveFolder::Base
  def services
    @services ||= @content['services'].collect{|s| Service.find(s)}
  end
  
  def case_study
    @case_study ||= CaseStudy.find(@content['case_study'])
  end
end