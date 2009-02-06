xml.instruct!
xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title 'With Imagination News'
    xml.link news_url
    xml.description 'The latest news from With Imagination'
    xml.language "en-au"

    for news in @news
      xml.item do
        xml.pubDate news.created_at.to_date
        xml.title h(news.title)
        xml.description simple_format(news.content)
      end
    end
  end
end
