Factory.define :project do |p|
  p.name "Win"
  p.description "We won and then ate cake"
end

Factory.define :page do |p|
  p.title "Title"
  p.permalink 'perma'
end

Factory.define :enquiry do |e|
  e.email 'han.solo@example.com'
  e.name 'Han Solo'
  e.message 'She is fast enough for you old man'
end

Factory.define(:news) do |n|
  n.title 'We win!!'
  n.content 'After winnig, WI had cake  '
end