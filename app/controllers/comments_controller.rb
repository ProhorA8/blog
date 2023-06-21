class CommentsController < ApplicationController
  before_action :set_post, only: %i[create destroy]
  before_action :set_comment, only: [:destroy]

  def new
    @post = current_user.posts.build
  end

  def create
    @new_comment = @post.comments.build(comment_params)
    @new_comment.user = current_user
    @new_comment.save
    redirect_to post_path(@post)
  end

  def destroy
    message = { notice: I18n.t('controllers.comments.destroyed') }

    if current_user_can_edit?(@comment)
      @comment.destroy!
    else
      message = { alert: I18n.t('controllers.comments.error') }
    end

    redirect_to post_path(@post), message
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:user_name, :body)
  end
end
