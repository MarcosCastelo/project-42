Rails.application.routes.draw do
  get "/mangas", to:"mangas#index"
  get "/mangas/:id", to: "manga#show"
end
