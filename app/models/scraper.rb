require 'nokogiri'
require 'open-uri'

class Scraper

  def get_site_response(url)
    if url
      html = URI.open(url)
      doc = Nokogiri::HTML(html)
  end

  def self.attach_manga(response)
      doc = get_site_response(response)

      manga = {
        "title" => doc.css('.detail-info-right-title-font')[0].children.text,
        "author" => doc.css('.detail-info-right-say a')[0]['title'],
        "last_chapter" => doc.css('.detail-main-list-main .title3')[0].children.text,
        "image" => doc.css('.detail-info-cover-img')[0]['src'],
        "status" => doc.css('.detail-info-right-title-tip')[0].children.text,
        "link" => url
      }
      return self.save(manga)
  end

  def self.save(manga_attributes)
    manga = Manga.where(manga_attributes)
    if manga.empty?
      new_manga = Manga.new(manga_attributes)
      if new_manga.save
        return new_manga
      else
        return nil
      end
    else
      return manga[0]
    end
    
  end
end