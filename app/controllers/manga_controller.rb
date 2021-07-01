class MangaController < ApplicationController
  def index
    @mangas = Manga.all
  end

  def show
    @manga = Manga.find(params[:id])

    if params[:email]
      @user = User.where(email: params[:email])[0]
      if !@user
        @user = User.create!(email: params[:email])
      end

      if !@manga.users.include?(@user)
        @user.mangas << @manga
        @user.save
      end
    end

  end

  def add
    if params[:search]
      scraper = Scraper.new(params[:search])
      @new_manga = scraper.save
      if @new_manga 
        redirect_to controller: 'manga', action: 'show', id: @new_manga.id
      end
    end
  end
end
