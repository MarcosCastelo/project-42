Rails.application.routes.draw do
  root "manga#add"
  get "/mangas", to:"manga#index"
  get "/mangas/:id", to: "manga#show", as: "show"
  get "/add", to: "manga#add", as: "add_manga"
end
