class Notifier < ActionMailer::Base
  
  def enquiry enquiry
    recipients 'info@wi.com.au'
    from enquiry.full_name_with_email
    subject "#{enquiry.full_name} has an enquiry for WI"
    body :enquiry => enquiry
  end
  
  def confirmation enquiry
    recipients enquiry.full_name_with_email
    from 'no-reply@wi.com.au'
    content_type 'text/html'
    subject "Thank you for your enquiry"
    body :enquiry => enquiry
  end
end
