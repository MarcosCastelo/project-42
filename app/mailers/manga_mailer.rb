class MangaMailer < ApplicationMailer
    default from:ENV['default_email']
    def notify(user, manga)
      mail(to: user.email, subject: "#{manga.title} has new chapter!")
    end
end
