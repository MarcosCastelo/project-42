require "test_helper"

class MangaControllerTest < ActionDispatch::IntegrationTest
  def setup
    @manga = Manga.new(title: 'One Piece', link: 'https://mangafox.la')
    @manga.save
  end

  test "should get manga list" do
    get '/mangas'
    assert_response :success
  end

  test "should get manga detail" do
    get "/mangas/#{@manga.id}"
    assert_response :success
  end
end
