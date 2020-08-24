class PostsController < ApplicationController
  before_action :move_to_sign_in, except: [:index, :show]
  before_action :set_post, except: [:new, :create, :index]
  before_action :posted_user?, except: [:new, :create, :index, :show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    else
      render :show
    end
  end

  private

  def move_to_sign_in
    redirect_to new_user_session_path unless user_signed_in?
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def posted_user?
    redirect_to post_path(params[:id]) unless @post.user_id == current_user.id
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
