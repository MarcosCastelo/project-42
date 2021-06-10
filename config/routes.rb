Rails.application.routes.draw do
  get "/mangas", to:"manga#index"
  get "/mangas/:id", to: "manga#show"
end
