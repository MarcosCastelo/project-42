namespace :batch do
  desc "TODO"
  task update_mangas: :environment do
    Manga.all.each do |manga|
      if manga.status == "Ongoing"
        scraper = Scraper.new(manga.link)
        result = scraper.manga_params
        puts "RESULT => #{result}"

        if result[:last_chapter] != manga.last_chapter
          puts "#{manga.title} has new chapter!"
        end

        manga.update(result)
      end
    end
  end

end
