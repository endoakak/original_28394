class UsersController < ApplicationController
  def show
    redirect_to posts_path unless user_signed_in?
  end
end
