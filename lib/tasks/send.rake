namespace :send do
    desc "TODO"
    task mail: :environment do
      user = User.new(email: "fanexworld@gmail.com")
      MangaMailer.send_welcome(user).deliver_now
    end
  
  end
  