ActionView::Base.field_error_proc = Proc.new {|tag, record|
  "<span class=\"fieldWithErrors\">#{tag}</span>"
}