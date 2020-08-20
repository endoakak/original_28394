Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  resources :posts
  get "/users/show", to: "users#show"
end
