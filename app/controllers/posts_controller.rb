class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index = @posts = Post.all

  def show
    @comments = @post.comments if @post.comments.any?
    @new_comment = @post.comments.build(params[:comment])
  end

  def new = @post = Post.new

  def edit; end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to user_path(current_user)
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to user_path(current_user), status: :see_other
  end

  private

  def set_post = @post = Post.find(params[:id])

  def post_params
    params.require(:post).permit(:title, :body, images: [])
  end
end
