class Notifier < ActionMailer::Base
  
  def enquiry enquiry
    recipients 'notify@wi.com.au'
    from enquiry.name_with_email
    subject "#{enquiry.name} has an enquiry for WI"
    body :enquiry => enquiry
  end
end
