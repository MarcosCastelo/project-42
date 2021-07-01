require 'nokogiri'
require 'open-uri'

class Scraper
  def initialize(url)
    @url = url
    @manga_params = self.get_manga_params
  end

  def manga_params
    @manga_params
  end
  
  def get_site_response
    html = URI.open(@url)
    doc = Nokogiri::HTML(html)
    return doc
  end

  def get_manga_params
    doc = self.get_site_response
    if doc
      manga = {
        "title" => doc.css('.detail-info-right-title-font')[0].children.text,
        "author" => doc.css('.detail-info-right-say a')[0]['title'],
        "last_chapter" => doc.css('.detail-main-list-main .title3')[0].children.text,
        "image" => doc.css('.detail-info-cover-img')[0]['src'],
        "status" => doc.css('.detail-info-right-title-tip')[0].children.text,
        "link" => @url
      }
      return manga
    end
  end


  def save
    puts "MANGA_PARAMS => #{@manga_params}"
    manga = Manga.where(link=@manga_params[:link])[0]
    puts "WHERE RESULT => #{manga}"
    if !manga
      new_manga = Manga.new(@manga_params)
      if new_manga.save
        return new_manga
      return nil
      end
    end

    return manga
  end
end