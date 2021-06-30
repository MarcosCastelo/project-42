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

  def add_manga_to_user
    user = User.where(params[:email])[0]
    if !user
      if User.where(params[:email]).empty?
        user = User.new
        user.email = params[:email]
        user.mangas << @manga
        user.save
      else
        user.mangas << @manga
        user.save
      end
    end
  end
end
