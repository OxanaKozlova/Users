class CommentsController < ApplicationController
before_action :set_comment, only:[:update]

  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.post = @post
    if @comment.save
      flash[:notice] = 'Comment was successfully created.'
      redirect_to @post
    else  render :new
    end
  end

  def update
    if @comment.update(comment_params)
      flash[:notice] = 'Comment was successfully updated.'
      redirect_to comments_path
    else  render :edit
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
