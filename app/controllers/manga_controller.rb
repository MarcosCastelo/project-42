class MangaController < ApplicationController
  def index
    @mangas = Manga.all
  end
end
