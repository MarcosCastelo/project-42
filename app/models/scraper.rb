require 'nokogiri'
require 'open-uri'

class Scraper
  def initialize(base_url)
    @url = base_url
  end

  def search(param)
    html = URI.open(@url + param)
    doc = Nokogiri::HTML(html)

    mangas = []

    doc.css(".manga-list-4-list li").each do |item|
      manga = {
        "title" => item.css('.manga-list-4-item-title a').first['title'],
        "author" => item.css('.manga-list-4-item-tip a').first['title'],
        "last_chapter" => item.css('.manga-list-4-item-tip a')[1].children.text,
        "image" => item.css('.manga-list-4-cover')[0]['src'],
        "status" => item.css('.manga-list-4-show-tag-list-2 a')[0].children.text,
        "link" => @url + item.css('a')[0]['href']

      }
      mangas.append(manga)
    end
    
    mangas
  end
end