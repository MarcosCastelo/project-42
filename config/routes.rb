Rails.application.routes.draw do
  get "/mangas", to:"manga#index"
  get "/mangas/:id", to: "manga#show"
  get "/attach", to: "manga#attach", as: "attach_manga"
  get "/add", to: "manga#add_manga_to_user", as: "add_manga_user"
end
