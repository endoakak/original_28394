class PostsController < ApplicationController
  before_action :move_to_sign_in, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def post_params
    params.require(:post).permit(
      :title,
      :content,
      :spoiler,
      :category_id
    ).merge(user_id: current_user.id)
  end
end
