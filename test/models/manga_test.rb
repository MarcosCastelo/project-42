require "test_helper"

class MangaTest < ActiveSupport::TestCase
  test "should save manga if have title and link" do
    manga = Manga.new(title: 'One Piece', link: 'https://mangafox.la/One+Piece')
    assert manga.save
  end
  
  
  test "should not save manga without title" do
    manga = Manga.new(link: 'https://mangafox.la/One+Piece')
    assert !manga.save
  end

  test "should not save manga without link" do
    manga = Manga.new(title: "One Piece")
    assert = !manga.save
  end

  test "should not save manga without title or link" do
    manga = Manga.new
    assert !manga.save
  end
end