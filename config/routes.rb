Rails.application.routes.draw do
  get 'inquiry/new'
  get 'inquiry/confirm'
  get 'inquiry/thanks'
  ActiveAdmin.routes(self)
  devise_for :users
  root to: "home#top"
  resources :posts do
    collection do
      get "novel"
      get "movie"
      get "comic"
      get "anime"
      get "search"
    end
    post "/reactions/:id", to: "reactions#create", as: "reactions"
    delete "/reactions/:id", to: "reactions#destroy"
  end
  get "/users/show", to: "users#show"
end
