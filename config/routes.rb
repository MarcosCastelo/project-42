Rails.application.routes.draw do
  get "/mangas", to:"manga#index"
  get "/mangas/:id", to: "manga#show"
  get "/attach", to: "manga#attach", as: "attach_manga"
end
