class PostsController < ApplicationController
  def index = @posts = Post.all

  def show = @post = Post.find(params[:id])

  def new = @post = Post.new

  def edit = @post = Post.find(params[:id])

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to user_path(@user)
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to user_post_path(@post)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, images: [])
  end
end
