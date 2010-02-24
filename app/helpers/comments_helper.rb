module CommentsHelper
  def anti_spam_fields
    content_tag(:div, label_tag(:email, "Please leave blank") + text_field_tag(:email, ''), :id => 'fake_email')
  end
end
