class CommentsController < ApplicationController

  before_action :set_post!

  def create
    @commentable = Post.find(params["post_id"])
    @comment = @commentable.comments.build comment_params
    @commentable = @commentable.decorate

    if @comment.save
      # redirect_to posts_path(@post) 
      redirect_to post_path(@commentable)
    else
      # render('posts/show')
      # @comment = @comment.decorate if @comment
      # @post = @post.decorate if @post
      redirect_to post_path(@commentable)
    end
  end

  def destroy
    @commentable = Post.find(params["post_id"])
    comment = @commentable.comments.find params[:id]
    comment.destroy
    redirect_to post_path(@commentable)
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(user: current_user)
  end

  def set_post!
    @post = Post.find params[:post_id]
    #@post = @commentable.is_a?(Post) ? @commentable : @commentable.post
  end

end