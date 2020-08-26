Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  resources :posts do
    collection do
      get "novel"
      get "movie"
      get "comic"
      get "anime"
    end
    post "/reactions/:id", to: "reactions#create", as: "reactions"
    delete "/reactions/:id", to: "reactions#destroy"
  end
  get "/users/show", to: "users#show"
end
