Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  resources :posts do
    post "/reactions/:id", to: "reactions#create", as: "reactions"
    delete "/reactions/:id", to: "reactions#destroy"
  end
  get "/users/show", to: "users#show"
end
