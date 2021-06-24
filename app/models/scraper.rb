require 'nokogiri'
require 'open-uri'

class Scraper
  def initialize(base_url)
    @url = base_url
  end
end