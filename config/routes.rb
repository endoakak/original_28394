Rails.application.routes.draw do
  devise_for :users
  root to: "home#top"
  resources :posts, only: [:new, :create, :index, :show, :edit, :update]
end
