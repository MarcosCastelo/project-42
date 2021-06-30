class MangaController < ApplicationController
  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])
  end

  def attach
    if params[:search]
      scraper = Scraper.new(params[:search])
      @manga = scraper.save
    end
  end
end
